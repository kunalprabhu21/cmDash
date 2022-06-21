import 'package:cm_dashboard/controllers/AddTaskController.dart';
import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:cm_dashboard/controllers/CmActionController.dart';
import 'package:cm_dashboard/controllers/InternetController.dart';
import 'package:cm_dashboard/controllers/LoginController.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/controllers/TableController.dart';
import 'package:cm_dashboard/controllers/TaskController.dart';
import 'package:cm_dashboard/pages/AddTask.dart';
import 'package:cm_dashboard/pages/AppointmentScreen.dart';
import 'package:cm_dashboard/pages/Splash.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cm_dashboard/utils/ThemeConfig.dart';
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

import 'pages/FilesDetails.dart';
import 'pages/budget/ViewPage.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then(
        (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CaledarController>(
            create: (BuildContext context) => CaledarController(),
          ),
          ChangeNotifierProvider<MenuController>(
            create: (BuildContext context) => MenuController(),
          ),
          ChangeNotifierProvider<ThemeNotifier>(
            create: (BuildContext context) => ThemeNotifier(),
          ),
          ChangeNotifierProvider<TableController>(
            create: (BuildContext context) => TableController(),
          ),
          ChangeNotifierProvider<CmActionController>(
            create: (BuildContext context) => CmActionController(),
          ),
          ChangeNotifierProvider<TaskController>(
            create: (BuildContext context) => TaskController(),
          ),
          ChangeNotifierProvider<AddTaskController>(
            create: (BuildContext context) => AddTaskController(),
          ),
          ChangeNotifierProvider<LoginController>(
            create: (BuildContext context) => LoginController(),
          ),
          ChangeNotifierProvider<InternetController>(
            create: (BuildContext context) => InternetController(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Admin Panel',
            theme: theme.getTheme(),
            home: SplashScreen(),
          ),
        )
    );
  }
}
