
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cm_dashboard/models/Status.dart';
import 'package:cm_dashboard/utils/sharedPref.dart';
import 'package:crypto/crypto.dart';
import 'package:platform_device_id_platform_interface/platform_device_id_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Constants {
  static const double kPadding = 20.0;
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
  static const double SizedBoxHeight = 20.0;


}
const defaultPaddingCalenderButtons = 20.0;
var defaultFont = GoogleFonts.nunito();
DateTime selectedDateExtend = DateTime.now();
DateTime selectedDateReassign = DateTime.now();
DateTime selectedDateAppointment = DateTime.now();
DateTime selectedDate = DateTime.now();
TimeOfDay selectedTime = TimeOfDay.now();
TimeOfDay selectedStartTime = TimeOfDay.now();
TimeOfDay selectedEndTime = TimeOfDay.now();


String simplifyDateDMY(DateTime date,String formatType) {
  // var formatter = new DateFormat('dd MMMM y – kk:mm');
  var formatter =  DateFormat(formatType);
  //var formatter = new DateFormat("yMMMMEEEEd");
  String formatted = formatter.format(date);
  return formatted;
}

String simplifyTimehh_mm(DateTime time,String formatType) {
  // var formatter = new DateFormat('dd MMMM y – kk:mm');
  var formatter =  DateFormat(formatType);
  //var formatter = new DateFormat("yMMMMEEEEd");
  String formatted = formatter.format(time);
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

Future<String> selectTime(BuildContext context,String type) async {

  setTimeOnType(type);

  TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: selectedTime,

  );
  if (picked != null && picked != selectedTime )

    if(type == "start"){
      selectedStartTime = picked;
      selectedTime = selectedStartTime;

    }else if(type == "end"){
      selectedEndTime = picked;
      selectedTime = selectedEndTime;
    }

      selectedTime = picked!;

      return picked.format(context);

}

Future<DateTime?> selectDate(BuildContext context,String type) async {

 setDateOnType(type);

 final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
  if (picked != null && picked != selectedDate) {

    if(type == "extend"){
      selectedDateExtend = picked;
      selectedDate = selectedDateExtend;

    }else if(type == "reassign"){
      selectedDateReassign = picked;
      selectedDate = selectedDateReassign;
    }else if(type == "appointmentDate"){
      selectedDateAppointment = picked;
      selectedDate = selectedDateAppointment;
    }

      return selectedDate;
  }
}

void setDateOnType(String type){

  switch (type) {
    case "extend":
      selectedDate = selectedDateExtend;
      break;
    case "reassign":
      selectedDate = selectedDateReassign;
      break;
    case "appointmentDate":
      selectedDate = selectedDateAppointment;
      break;
  }

}
void setTimeOnType(String type){

  switch (type) {
    case "start":
      selectedTime = selectedStartTime;
      break;
    case "end":
      selectedTime = selectedEndTime;
      break;

  }

}

//navigators//
push(context, page){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>page));
}

pushReplacement(context,page){
  Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (context) =>page));
}

pop(context){
  Navigator.of(context).pop();
}

showErrorToast(String message ,context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),backgroundColor: Colors.redAccent,duration: Duration(seconds: 1),
  ),);
}

showSuccessToast(String message ,context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),backgroundColor: Colors.green,duration: Duration(seconds: 1),
  ),);
}

progressIndicator(context){
  showDialog(context: context, builder: (context){
    return Material(
        color: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ));
  });
}

// Future<String?> getId() async {
//   var deviceInfo = DeviceInfoPlugin();
//   if (Platform.isIOS) { // import 'dart:io'
//     var iosDeviceInfo = await deviceInfo.iosInfo;
//     return iosDeviceInfo.identifierForVendor; // unique ID on iOS
//   } else if(Platform.isAndroid) {
//     var androidDeviceInfo = await deviceInfo.androidInfo;
//     return androidDeviceInfo.androidId; // unique ID on Android
//   }
// }

Future<String?> deviceInfo() async{

  return await PlatformDeviceIdPlatform.instance.getDeviceId();
}

String barSpereratedString(List<String> params) {
  String s = params.join('|');
  return s;
}


Future<String> encryptPassword(String password) async {

  SharedPref sharedPref = SharedPref();
  final userInfo = await sharedPref.read("appAuth");
  var jsonParseUserInfo = jsonDecode(userInfo!);
  String token = jsonParseUserInfo['access_token'];
  String tokenSubString = token.substring(0,5);
  log('token: $token');
  var md5hash = md5.convert(utf8.encode(password)).toString();
  var md5hash2 = md5.convert(utf8.encode(md5hash)).toString();
  var bytes2 = utf8.encode(md5hash2);

  // data being hashed
  var sha256Pass = sha256.convert(bytes2);
  return sha256Pass.toString() + tokenSubString;

}

bool? checkDateDiff(String fromDate, String toDate){
  var parsedDateFrom = DateTime.parse(fromDate);
  var parsedDateTo = DateTime.parse(toDate);


  return true;

}



//

