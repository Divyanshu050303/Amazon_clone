import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed:onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(8.0),
        minimumSize: MaterialStateProperty.all(Size(150, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Adjust the border radius
          ),
        ),
      ),
      child:   Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
