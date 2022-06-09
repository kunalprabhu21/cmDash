
import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/controllers/CalendarController.dart';
import 'package:admin_panel_responsive_flutter/controllers/MenuController.dart';
import 'package:admin_panel_responsive_flutter/pages/drawer/drawer_page.dart';
import 'package:admin_panel_responsive_flutter/pages/files/ViewList.dart';

import 'package:admin_panel_responsive_flutter/pages/widgets/SideBar.dart';
import 'package:admin_panel_responsive_flutter/pages/widgets/app_bar_widget.dart';
import 'package:admin_panel_responsive_flutter/responsive_layout.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'panel_center/panel_center_page.dart';
import 'panel_right/panel_right_page.dart';



class AppointmentScreen extends StatefulWidget {

  _AppointmentScreenState createState() => _AppointmentScreenState();
}


class _AppointmentScreenState extends State<AppointmentScreen> {
  int currentIndex = 2;
  List<Widget> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];
  @override
  void initState() {
    super.initState();
    // caledarController(context, listen: false).initDayView();
  }


  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<CaledarController>();
    final controllerMenu = context.watch<MenuController>();
    return Scaffold(
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
              width: controllerMenu.menuWidth,
              child:SidebarView(),
              // height: 40,
              color: Colors.white,
            ),
            Expanded(
              // It takes 5/6 part of the screen
                flex: 6,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(simplifyDateDMY(controllerCalendar.now,"MMM y"),style: Theme.of(context).textTheme.headline1,)
                            ],
                          ),
                          Row(
                            children: [
                              RaisedButton(
                                child: Text("Today", style: Theme.of(context).textTheme.bodyText2),
                                onPressed: (){
                                  controllerCalendar.showToday();
                                },
                                color: Theme.of(context).backgroundColor,
                                padding: EdgeInsets.symmetric(vertical: defaultPaddingCalenderButtons),
                                splashColor: Colors.grey,
                              ),
                              SizedBox(width: 5,),
                              TextButton(
                                onPressed: () {
                                  controllerCalendar.prevDate();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Theme.of(context).backgroundColor,
                                  minimumSize: Size.zero,
                                  // padding: EdgeInsets.zero,// Set this
                                  // and this
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(Icons.arrow_back_ios,color: Colors.black,),
                                ),
                              ),
                              SizedBox(width: 5,),
                              TextButton(
                                onPressed: () {
                                  controllerCalendar.nextDate();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Theme.of(context).backgroundColor,
                                  minimumSize: Size.zero,
                                  // padding: EdgeInsets.zero,// Set this
                                  // and this
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                                ),
                              ),

                              SizedBox(width: 10,),
                              RaisedButton(
                                child: Text("Month", style: Theme.of(context).textTheme.bodyText2),
                                onPressed: (){
                                  controllerCalendar.setCalendarView("month");
                                },
                                color: Theme.of(context).backgroundColor,
                                padding: EdgeInsets.symmetric(vertical: defaultPaddingCalenderButtons),
                                splashColor: Colors.grey,
                              ),
                              RaisedButton(
                                child: Text("Day", style: Theme.of(context).textTheme.bodyText2),
                                onPressed: (){
                                  controllerCalendar.setCalendarView("day");
                                },
                                color: Theme.of(context).backgroundColor,
                                padding: EdgeInsets.symmetric(vertical: defaultPaddingCalenderButtons),
                                splashColor: Colors.grey,
                              ),
                              RaisedButton(
                                child: Text("Week", style: Theme.of(context).textTheme.bodyText2),
                                onPressed: (){
                                  controllerCalendar.setCalendarView("week");
                                },
                                color: Theme.of(context).backgroundColor,
                                padding: EdgeInsets.symmetric(vertical: defaultPaddingCalenderButtons),
                                splashColor: Colors.grey,
                              ),
                            ],
                          )


                        ],
                      ),
                    ),

                    Expanded(
                        child: controllerCalendar.activeView
                    )
                  ],
                )
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


