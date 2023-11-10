import 'package:flutter/material.dart';
import 'package:youtube_clone/constants/global_variable.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed:onTap,
      style: ButtonStyle(
        backgroundColor:MaterialStateColor.resolveWith((states) => const Color.fromRGBO(255, 153, 0, 1),),
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
