import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/Providers/user_provider.dart';
import 'package:youtube_clone/comman/widget/bottom_bar.dart';
import 'package:youtube_clone/constants/global_variable.dart';
import 'package:youtube_clone/features/Home/Screen/HomeScreen.dart';
import 'package:youtube_clone/features/auth/screen/auth_screen.dart';
import 'package:youtube_clone/features/auth/screen/services/auth_services.dart';
import 'package:youtube_clone/router.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
