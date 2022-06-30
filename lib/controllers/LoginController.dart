import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:cm_dashboard/pages/Home.dart';
import 'package:cm_dashboard/pages/Login.dart';
import 'package:cm_dashboard/routes.dart';
import 'package:cm_dashboard/utils/ApiCall.dart';
import 'package:cm_dashboard/utils/Urls.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


LoginController loginController(context, {bool listen: true}) =>
    Provider.of<LoginController>(context, listen: listen);

class LoginController extends ChangeNotifier{
  LinkedHashMap _validationLog = LinkedHashMap();
  LinkedHashMap _validationMessage = LinkedHashMap();
  LinkedHashMap get validationMessage => _validationMessage;
  final _username = TextEditingController();
  get name => _username;
  SharedPref sharedPref = SharedPref();

  final _password = TextEditingController();
  get password => _password;


  resetFieldsSignUp(){
    _username.clear();
    _password.clear();

  }

  appAuth(context) async {

    final map = Map<String, dynamic>();
    map['username'] = "CMDASH";
    map['password'] = "CMDASH@1\$34";
    map['grant_type'] = "password";
    final res = await callApi.post(context, url: Urls().APP_AUTH,data: map);
    log('AppAuth: $res');
    if(res!.ErrorYn == "Y"){
      showErrorToast(res.ErrMsg!,context);
      Navigator.pop(context);
    }else{
      final userData = res.Data;
      SharedPref().save("appAuth", userData);

    }

  }

  logInUser(context) async {
    if(_username.text == ""){
      showErrorToast("Please enter username/Email",context);
    }else if(password.text == ""){
      showErrorToast("Enter enter Password",context);
    }else{
      String? deviceId = await deviceInfo();
      var passwordSHA = await encryptPassword(password.text);
      List<String> params = [_username.text,passwordSHA,deviceId!];
      String paramConvert = barSpereratedString(params);
      final map = Map<String, dynamic>();
      map['inputString'] = paramConvert;
      progressIndicator(context);
      final res = await callApi.postWithHeader(context, url: Urls().LOGIN,data: jsonEncode(map));
      log('AppAuth: $res');
      if(res!.ErrorYn == "Y"){
        showErrorToast(res.ErrMsg!,context);
        Navigator.pop(context);
      }else{
        //saves user and initial login date in stored Pref
        final userData = res.Data;
        log('USER_DATA: $userData');
        SharedPref().save("UserInfo", userData);
        SharedPref().save("lastLogin", DateTime.now().toString());
        Navigator.pop(context);
        showSuccessToast("Login Successfully",context);
        Get.toNamed(RouteHelper.getDashBoardRoute());
      }
      }
    }


  getServerDateTime(context) async {
      String? deviceId = await deviceInfo();
      final username = await sharedPref.readParsedValue("UserInfo","username");
      List<String> params = [username!,deviceId!];
      String paramConvert = barSpereratedString(params);
      final map = Map<String, dynamic>();
      map['inputString'] = paramConvert;
      final res = await callApi.postWithHeader(context, url: Urls().SERVERDATETIME,data: jsonEncode(map));
      // var dateTo = res!.Data[''];
      log('AppAuth: $res');
      if(res!.ErrorYn == "Y"){
        showErrorToast(res.ErrMsg!,context);
        Navigator.pop(context);
      }else{

        //checks for server date and last login date difference
        var dateFrom = await sharedPref.read("lastLogin");

        // bool? daysValid = checkDateDiff(dateFrom.toString(),dateTo.toString());

        //if days exceeds navigate to Login else Home
        Get.toNamed(RouteHelper.getDashBoardRoute());


      }

  }
  }



