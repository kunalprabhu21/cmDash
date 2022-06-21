import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/pages/drawer/DrawerPage.dart';
import 'package:cm_dashboard/pages/files/ViewList.dart';
import 'package:cm_dashboard/pages/widgets/SideBar.dart';
import 'package:cm_dashboard/pages/widgets/AppBar.dart';
import 'package:cm_dashboard/utils/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FileMain extends StatefulWidget {
  @override
  _FileMainState createState() => _FileMainState();
}

class _FileMainState extends State<FileMain> {
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
            Expanded(child: ViewList()),

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
