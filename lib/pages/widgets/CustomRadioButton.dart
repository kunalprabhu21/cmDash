import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRadioListTile<T> extends StatelessWidget {

  final String text;
  final String id;
  final String activeIndex;
  final int lastBorderIndex;

  const MyRadioListTile({

    required this.text,
    required this.id,
    required this.activeIndex,
    required this.lastBorderIndex,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.text;
    final index = this.id;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
      decoration: BoxDecoration(
          color: activeIndex == id ? Color(0xff1e224c) : Colors.transparent,
          border: Border(
              bottom: BorderSide(
                  color: Color(0xff1e224c),
                  width: 2.0
              ),
            top: BorderSide(
                color: Color(0xff1e224c),
                width: 2.0
            ),
              left: index == "1" ? BorderSide(
          color: Color(0xff1e224c),
          width: 2.0
      ) : BorderSide(width: 0,color: Colors.transparent)!,
            right: index == lastBorderIndex.toString() ? BorderSide(
                color: Color(0xff1e224c),
                width: 2.0
            ) : BorderSide(width: 0,color: Colors.transparent)!,
          )
      ),

      child: Text(title,style: GoogleFonts.nunito(fontSize: 13,fontWeight: FontWeight.bold,color: activeIndex == id ? Colors.white : Colors.black,),),
    );
  }


}