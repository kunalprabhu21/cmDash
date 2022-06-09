import 'package:admin_panel_responsive_flutter/controllers/MenuController.dart';
import 'package:admin_panel_responsive_flutter/pages/Login.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:provider/provider.dart';



class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    new Timer(new Duration(milliseconds: 3000), () { // set your desired delay time here
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginPage()));
    });
    menuController(context, listen: false).fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Splash Screen",style: GoogleFonts.nunito(fontSize: 25,color:Colors.black),),
      ),
    );
  }
}