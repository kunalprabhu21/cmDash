import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {

  bool showHomeIcon;

  AppBarWidget({this.showHomeIcon = true,});
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<MenuController>();
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(

            )
          else
            widget.showHomeIcon == true ? IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            ) : IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: () {

              },
              icon: Icon(Icons.arrow_back_outlined),
            ),
          SizedBox(width: Constants.kPadding),
          if (ResponsiveLayout.isComputer(context))
            widget.showHomeIcon == true ? OutlinedButton(
              onPressed: () {
                controllerCalendar.toggleMenu();
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.menu),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(color: Colors.white, width: 0.4)),
            ) : OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.arrow_back_outlined),
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(color: Colors.white, width: 0.4)),
            ),
          Spacer(),
          if (ResponsiveLayout.isComputer(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Overview"),
                SizedBox(width: 50,),
                Text("Revenue"),
                SizedBox(width: 50,),
                Text("Sales"),
                SizedBox(width: 50,),
                Text("Control"),
              ],
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Constants.red,
                          Constants.orange,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ], shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Constants.orange,
                radius: 30,
                backgroundImage: AssetImage(
                  "images/profile.png",
                ),
              ),
            ),
        ],
      ),
    );
  }
}
