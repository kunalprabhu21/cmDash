

import 'package:flutter/material.dart';

class CustomButtons{

  TextButton CustomTextButton(String text,int backgroundColor, VoidCallback functionApply ) {
    return  TextButton(
      onPressed: functionApply,
      child: Text('TextButton'),
    );
  }

  Widget? customElevatedButton(String text,Color? buttonColor ){

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor, // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () {},
      child: Text(text),
    );
  }


}