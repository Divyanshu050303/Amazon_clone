import 'package:flutter/material.dart';
import 'package:youtube_clone/constants/errorHandling.dart';
import 'package:youtube_clone/constants/utils..dart';
import 'package:youtube_clone/models/user.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/global_variable.dart';

class AuthService {
  void signUpUser(
      {required String email,
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
          cart: []);
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
}
