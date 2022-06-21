import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Badges<T> extends StatelessWidget {

  final String text;
  final int colorValue;


  const Badges({

    required this.text,
    required this.colorValue,

  });

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(

        child: Text(text,style: GoogleFonts.nunito(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white),),
        decoration: BoxDecoration(
          color: Color(colorValue),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      ),
    );
  }


}