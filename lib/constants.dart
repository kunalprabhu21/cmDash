
import 'package:admin_panel_responsive_flutter/models/Status.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Constants {
  static const double kPadding = 10.0;
  static const Color purpleLight = Color(0XFF1e224c);
  static const Color purpleDark = Color(0XFF0d193e);
  static const Color orange = Color(0XFFec8d2f);
  static const Color red = Color(0XFFf44336);
  static const Color cardColorOpen = Color(0xff01b0f1);
  static const Color cardColorinTime = Color(0xfffec100);
  static const Color cardColorlapsed = Color(0xfffe6600);
  static const Color cardColorCritical = Color(0xffdc4d37);
  static const double cardMargin = 30.0;
  static const double cardBorders = 10.0;


}
const defaultPaddingCalenderButtons = 20.0;
var defaultFont = GoogleFonts.nunito();

String simplifyDateDMY(DateTime date,String formatType) {
  // var formatter = new DateFormat('dd MMMM y – kk:mm');
  var formatter =  DateFormat(formatType);
  //var formatter = new DateFormat("yMMMMEEEEd");
  String formatted = formatter.format(date);
  return formatted;
}

List<RadioModel>? getStatus(){
  List<RadioModel> statusList = [];
  final data = [
    {
      'id':"1",
      'name':"CLOSE",
    },
    {
      'id':"2",
      'name':"REASSIGN",
    },
    {
      'id':"3",
      'name':"EXTEND",
    },
    {
      'id':"4",
      'name':"DECIDE LATER",
    }
  ];
  final userData = data as List;
  userData.forEach((element) {
    statusList.add(RadioModel.fromJson(element));
  });
  return statusList;

}
List<RadioModel>? getRTP(){
  List<RadioModel> statusList = [];
  final data = [
    {
      'id':"1",
      'name':"YES",
    },
    {
      'id':"2",
      'name':"NO",
    },
  ];
  final userData = data as List;
  userData.forEach((element) {
    statusList.add(RadioModel.fromJson(element));
  });
  return statusList;

}
List<RadioModel>? getXerox(){
  List<RadioModel> statusList = [];
  final data = [
    {
      'id':"1",
      'name':"YES",
    },
    {
      'id':"2",
      'name':"NO",
    },
  ];
  final userData = data as List;
  userData.forEach((element) {
    statusList.add(RadioModel.fromJson(element));
  });
  return statusList;

}