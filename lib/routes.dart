import 'dart:convert';


import 'package:cm_dashboard/pages/Files.dart';
import 'package:cm_dashboard/pages/FilesDetails.dart';
import 'package:cm_dashboard/pages/Home.dart';
import 'package:cm_dashboard/pages/Login.dart';
import 'package:cm_dashboard/pages/Splash.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashbaord';
  static const String fileList = '/fileList';
  static const String filesDetails = '/fileDetails';


  static String getInitialRoute() => '$initial';
  static String getSplashRoute() => '$splash';
  static String getLoginRoute() => '$login';
  static String getDashBoardRoute() => '$dashboard';
  static String getFileListRoute() => '$fileList';
  static String getFileDetailsRoute() => '$filesDetails';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => Home()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: fileList, page: () => FileMain()),
    GetPage(name: filesDetails, page: () => FilesDetails()),

  ];
}