

import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/pages/AddTask.dart';
import 'package:cm_dashboard/pages/BudgetList.dart';
import 'package:cm_dashboard/pages/Files.dart';
import 'package:cm_dashboard/pages/Tasks.dart';
import 'package:cm_dashboard/pages/appointments/AddTaskView.dart';
import 'package:cm_dashboard/pages/widgets/CustomButtons.dart';
import 'package:cm_dashboard/pages/widgets/CustomCards.dart';
import 'package:cm_dashboard/users.dart';
import 'package:flutter/material.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class CalendarViewPage extends StatefulWidget {
  @override
  _CalendarViewPageState createState() => _CalendarViewPageState();
}

class _CalendarViewPageState extends State<CalendarViewPage> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Open','Completed','Pending','Closed'];


  @override
  void initState() {
    super.initState();

  }

  void testFunction(){
    push(context, AddTask());
  }

  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<CaledarController>();
    final controllerMenu = context.watch<MenuController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(simplifyDateDMY(controllerCalendar.now,"MMM y"),style: Theme.of(context).textTheme.headline1,),
                  SizedBox(width: 10,),
                  CustomButtons().CustomTextButton("Add Appointmnet", 0xffededed,testFunction)
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
          flex: 2,
            child: controllerCalendar.activeView
        )
      ],
    );
  }

}
