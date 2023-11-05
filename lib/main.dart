import 'package:flutter/material.dart';
import 'package:youtube_clone/constants/global_variable.dart';
import 'package:youtube_clone/features/auth/screen/auth_screen.dart';
import 'package:youtube_clone/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primaryColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
        ),

      onGenerateRoute: (settings)=>generateRoute(settings),
      home:  const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

