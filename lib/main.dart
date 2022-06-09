import 'package:admin_panel_responsive_flutter/controllers/CalendarController.dart';
import 'package:admin_panel_responsive_flutter/controllers/MenuController.dart';
import 'package:admin_panel_responsive_flutter/controllers/TableController.dart';
import 'package:admin_panel_responsive_flutter/pages/Splash.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:admin_panel_responsive_flutter/utils/ThemeConfig.dart';
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

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
