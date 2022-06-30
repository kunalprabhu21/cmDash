import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/pages/budget/ListPage.dart';
import 'package:cm_dashboard/pages/budget/ViewPage.dart';
import 'package:cm_dashboard/pages/drawer/DrawerPage.dart';
import 'package:cm_dashboard/pages/files/ViewList.dart';
import 'package:cm_dashboard/pages/widgets/SideBar.dart';
import 'package:cm_dashboard/pages/widgets/AppBar.dart';
import 'package:cm_dashboard/utils/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;


class BudgetDetails extends StatefulWidget {
  @override
  _BudgetDetailsState createState() => _BudgetDetailsState();
}

class _BudgetDetailsState extends State<BudgetDetails> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  void initState() {
    super.initState();
    html.window.onUnload.listen((event) async {
      if (kIsWeb) html.window.location.reload();

    });
  }

  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<MenuController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: (ResponsiveLayout.isTinyLimit(context) ||
            ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(showHomeIcon: false,),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? ViewList()
            : currentIndex == 1
            ? Container()
            : Container(),
        // tablet: Row(
        //   children: [
        //     Expanded(child: PanelLeftPage()),
        //     Expanded(
        //       child: PanelCenterPage(),
        //     )
        //   ],
        // ),
        // largeTablet: Row(
        //   children: [
        //     Expanded(child: PanelLeftPage()),
        //     Expanded(child: PanelCenterPage()),
        //     Expanded(
        //       child: PanelRightPage(),
        //     )
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
            Expanded(child: ViewPage()),

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
