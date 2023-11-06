import 'package:flutter/material.dart';
import 'package:youtube_clone/comman/widget/Custom_TextFiled.dart';
import 'package:youtube_clone/comman/widget/custome_button.dart';
import 'package:youtube_clone/constants/global_variable.dart';
import 'package:youtube_clone/features/auth/screen/services/auth_services.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  Color colorSign = Colors.black;
  Color colorSignup = GlobalVariables.secondaryColor;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void singUpUser() {
    authService.signUpUser(email: _emailController.text,
        password: _passwordController.text,
        context: context,
        name: _nameController.text);
  }
  void singInUser() {
    authService.signInUser(email: _emailController.text,
        password: _passwordController.text,
        context: context,);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade200,
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            child: Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(top: mediaQueryData.size.height * 0.08),
                  child: SizedBox(
                      width: mediaQueryData.size.width * 0.65,
                      height: mediaQueryData.size.height * 0.2,
                      child: Image.asset(
                        "assets/Amazon.png",
                      )),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  child: Container(
                    color: Colors.white,
                    height: mediaQueryData.size.height * 0.683,
                    width: mediaQueryData.size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaQueryData.size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _auth = Auth.signup;
                                  colorSignup = GlobalVariables.secondaryColor;
                                  colorSign = Colors.black;
                                });
                              },
                              child: Text(
                                "Register",
                                style:
                                TextStyle(color: colorSignup, fontSize: 24),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _auth = Auth.signin;
                                  colorSign = GlobalVariables.secondaryColor;
                                  colorSignup = Colors.black;
                                });
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: colorSign, fontSize: 24),
                              ),
                            )
                          ],
                        ),
                        if (_auth == Auth.signup)
                          Form(
                              key: _signUpFormKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: mediaQueryData.size.height * 0.05,
                                  ),
                                  CustomTextField(
                                    controller: _nameController,
                                    hintText: "Name",
                                  ),
                                  SizedBox(
                                    height: mediaQueryData.size.height * 0.03,
                                  ),
                                  CustomTextField(
                                    controller: _emailController,
                                    hintText: "Email",
                                  ),
                                  SizedBox(
                                    height: mediaQueryData.size.height * 0.03,
                                  ),
                                  CustomTextField(
                                    controller: _passwordController,
                                    hintText: "PassWord",
                                  ),
                                  SizedBox(
                                    height: mediaQueryData.size.height * 0.07,
                                  ),
                                  CustomButton(
                                      text: "Create Account", onTap: () {
                                        if(_signUpFormKey.currentState!.validate()){
                                          singUpUser();
                                        }
                                  })
                                ],
                              )),
                        if (_auth == Auth.signin)
                          Form(
                              key: _signInFormKey,
                              child: Column(
                                children: [

                                  SizedBox(
                                    height: mediaQueryData.size.height * 0.07,
                                  ),
                                  CustomTextField(
                                    controller: _emailController,
                                    hintText: "Email",
                                  ),
                                  SizedBox(
                                    height: mediaQueryData.size.height * 0.03,
                                  ),
                                  CustomTextField(
                                    controller: _passwordController,
                                    hintText: "PassWord",
                                  ),
                                  SizedBox(
                                    height: mediaQueryData.size.height * 0.07,
                                  ), CustomButton(text: "login", onTap: () {
                                    if(_signInFormKey.currentState!.validate()){
                                      singInUser();
                                    }
                                  })
                                ],
                              )),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
