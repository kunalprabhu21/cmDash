import 'package:cm_dashboard/controllers/InternetController.dart';
import 'package:cm_dashboard/controllers/LoginController.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/pages/Login.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/utils/sharedPref.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:provider/provider.dart';



class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    super.initState();
    InternetController.checkConnectivity(context);
    loginController(context, listen: false).appAuth(context);
    // new Timer(new Duration(milliseconds: 3000), () { // set your desired delay time here
    //   Navigator.of(context).pushReplacement(
    //       new MaterialPageRoute(builder: (context) => new LoginPage()));
    // });
    menuController(context, listen: false).fetchMenu();
    checkIfFirstLogin();

  }
  checkIfFirstLogin() async {
    var userInfo = await sharedPref.read("UserInfo");
    var dateFrom = await sharedPref.read("lastLogin");
    if(userInfo != null){
     await loginController(context, listen: false).getServerDateTime(context).then((value) {



     });
    }else{
      push(context, LoginPage());
    }



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