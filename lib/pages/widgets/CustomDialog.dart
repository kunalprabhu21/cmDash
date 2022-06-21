import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

customDialog(context,Widget? body,String header){
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(10.0))),
        title: Text(header,style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;

            return body!;
          },
        ),
      )
  );
}