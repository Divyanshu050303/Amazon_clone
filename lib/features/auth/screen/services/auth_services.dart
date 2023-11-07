import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_clone/Providers/user_provider.dart';
import 'package:youtube_clone/comman/widget/bottom_bar.dart';
import 'package:youtube_clone/constants/errorHandling.dart';
import 'package:youtube_clone/constants/utils..dart';
import 'package:youtube_clone/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_clone/features/Home/Screen/HomeScreen.dart';

import '../../../../constants/global_variable.dart';

class AuthService {
  // signup
  void signUpUser({required String email,
    required String password,
    required BuildContext context,
    required String name}) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          // cart: []
      );
      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account created! Login with the same credentials");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  // signin
  void signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/signin"),
          body: jsonEncode({"email": email, "password": password}),
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences preferences =
            await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await preferences.setString(
                "X-auth-token", jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  // get user data
  void getUserData(
      BuildContext context,
  ) async {
    try {
      SharedPreferences preferences=await SharedPreferences.getInstance();
      String? token =preferences.getString("x-auth-token");
      if(token==null){
        preferences.setString("x-auth-token", '');
      }
      var tokenRes=await http.post(Uri.parse("$uri/tokenIsValid"),
      headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token':token!
      }
      );
      var response=jsonDecode(tokenRes.body);
      if(response==true){
        // await
        // get the user data
        http.Response userRes=await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              'Content-type': 'application/json; charset=UTF-8',
              'x-auth-token':token
            });
        var userProvider=Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }
}
