import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/features/Home/Screen/HomeScreen.dart';
import 'package:youtube_clone/features/auth/screen/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const AuthScreen(), settings: routeSettings);
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => const HomeScreen(), settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child:Text("Screen does not exist!")),
          ), settings: routeSettings);
  }
}
