import 'package:flutter/material.dart';

customDialog(context,Widget? body){
  showDialog(
      context: context, builder: (context){
    return AlertDialog(
      backgroundColor: Colors.white,
      content: body,
    );
  });
}