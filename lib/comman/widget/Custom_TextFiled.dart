import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  // final Icons icon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: mediaQueryData.size.width * 0.05,
          right: mediaQueryData.size.width * 0.05),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black)),
            enabledBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.black))),
        validator: (val) {
          if(val==null || val.isEmpty){
            return 'Enter you $hintText';
          }
          return null;
        },
      ),
    );
  }
}
