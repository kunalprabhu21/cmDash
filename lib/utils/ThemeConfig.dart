import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


ThemeNotifier themeController(context, {bool listen: true}) =>
    Provider.of<ThemeNotifier>(context, listen: listen);
class ThemeNotifier with ChangeNotifier {



  final lightTheme = ThemeData(

    errorColor: Colors.redAccent,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.grey
        ),
      ),
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepPurple.withOpacity(0.9),
      unselectedItemColor: Colors.grey.withOpacity(0.9),
    ) ,

    iconTheme: IconThemeData(
        color:Colors.deepPurpleAccent
    ),
    bottomAppBarColor: Colors.white,
    bottomAppBarTheme:BottomAppBarTheme(
      color:Color(0xff2D363F),
    ),
    textTheme: TextTheme(
    headline2: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold),
        button: TextStyle(color: Colors.black,fontSize: 12),

        headline1: GoogleFonts.nunito( fontSize: 25,

            fontWeight: FontWeight.bold,
            color: Colors.grey),
        subtitle1: TextStyle(fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF415094)),
        subtitle2: TextStyle(fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87),
        headline6: TextStyle(fontSize: 5,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        bodyText2: GoogleFonts.nunito(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal),
        bodyText1: GoogleFonts.nunito(color: Colors.white,fontSize: 40),
        caption: TextStyle(color: Color(0xFFCCC5AF),),
        headline3: TextStyle(fontSize: 20,
          color: Colors.grey,),
        headline4: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Color(0xFF727FC8))),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurpleAccent,
      //here you can give the text color
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,

    scaffoldBackgroundColor: Color(0xffeaf1f7),
    // primarySwatch: Colors.redAccent,
    // primaryColor: Colors.white,
    buttonColor:  Color(0xff9FC3D4),
    brightness: Brightness.light,
    backgroundColor: Colors.grey,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );
  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    _themeData = lightTheme;
    notifyListeners();
  }

}