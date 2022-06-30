import 'dart:html';

import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/pages/dashboard/DashboardPage.dart';
import 'package:cm_dashboard/pages/drawer/DrawerPage.dart';
import 'package:cm_dashboard/pages/files/ViewList.dart';

import 'package:cm_dashboard/pages/widgets/AppBar.dart';
import 'package:cm_dashboard/utils/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'widgets/SideBar.dart';

class PhotoViewer extends StatefulWidget {
  @override
  _PhotoViewerState createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  int currentIndex = 1;
  final PhotoViewController _controller = PhotoViewController();
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
            ? Container()
            : Container(),
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

        computer: Stack(
          children: [

            Expanded(child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 300.0,
              child: ClipRect(
                child: Image.network("https://www.gstatic.com/webp/gallery/2.jpg"),
              ),
            ),),
            AnimatedContainer (
              duration: Duration (milliseconds: 200),
              width: controllerCalendar.menuWidth,
              child:SidebarView(),
              // height: 40,
              color: Colors.white,
            ),

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
