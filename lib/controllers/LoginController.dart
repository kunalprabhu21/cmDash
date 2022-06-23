import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:cm_dashboard/pages/Home.dart';
import 'package:cm_dashboard/utils/ApiCall.dart';
import 'package:cm_dashboard/utils/Urls.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


LoginController loginController(context, {bool listen: true}) =>
    Provider.of<LoginController>(context, listen: listen);

class LoginController extends ChangeNotifier{
  LinkedHashMap _validationLog = LinkedHashMap();
  LinkedHashMap _validationMessage = LinkedHashMap();
  LinkedHashMap get validationMessage => _validationMessage;
  final _username = TextEditingController();
  get name => _username;


  final _password = TextEditingController();
  get password => _password;


  resetFieldsSignUp(){
    _username.clear();
    _password.clear();

  }

  logInUser(context) async {
    if(_username.text == ""){
      showErrorToast("Please enter username/Email",context);
    }else if(password.text == ""){
      showErrorToast("Enter enter Password",context);
    }else{
      final map = Map<String, dynamic>();
      map['username'] = _username.text;
      map['password'] = password.text;
      map['grant_type'] = "password";
      progressIndicator(context);
      final res = await callApi.post(context, url: Urls().LOGIN_URL,data: map);
      log('AppAuth: $res');
      if(res!.ErrorYn == "Y"){
        showErrorToast(res.ErrMsg!,context);
        Navigator.pop(context);
      }else{
        final userData = res.Data;
        SharedPref().save("userInfo", userData);
        Navigator.pop(context);
        showSuccessToast("Login Successfully",context);
        pushReplacement(context, Home());

      }
      }
    }
  }



