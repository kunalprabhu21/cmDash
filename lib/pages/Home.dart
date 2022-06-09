import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/controllers/MenuController.dart';
import 'package:admin_panel_responsive_flutter/pages/dashboard/dashboard_page.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';
import 'package:admin_panel_responsive_flutter/pages/files/ViewList.dart';

import 'package:admin_panel_responsive_flutter/pages/panel_center/panel_center_page.dart';

import 'package:admin_panel_responsive_flutter/pages/panel_right/panel_right_page.dart';
import 'package:admin_panel_responsive_flutter/pages/widgets/app_bar_widget.dart';
import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'widgets/SideBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<MenuController>();
    return Scaffold(
      key: controllerCalendar.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? ViewList()
            : currentIndex == 1
                ? PanelCenterPage()
                : PanelRightPage(),
        // tablet: Row(
        //   children: [
        //     AnimatedContainer (
        //       duration: Duration (milliseconds: 200),
        //       width: controllerCalendar.menuWidth,
        //       child:SidebarView(),
        //       // height: 40,
        //       color: Colors.white,
        //     ),
        //     Expanded(child: DashboardPage()),
        //
        //   ],
        // ),

        computer: Row(
          children: [
            AnimatedContainer (
              duration: Duration (milliseconds: 200),
              width: controllerCalendar.menuWidth,
              child:SidebarView(),
              // height: 40,
              color: Colors.white,
            ),
            Expanded(child: DashboardPage()),

          ],
        ),
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.purpleDark,
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : SizedBox(),
    );
  }
}
