import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel_responsive_flutter/pages/widgets/DayView.dart';
import 'package:admin_panel_responsive_flutter/pages/widgets/MonthView.dart';
import 'package:admin_panel_responsive_flutter/pages/widgets/WeekView.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


CaledarController caledarController(context, {bool listen: true}) =>
    Provider.of<CaledarController>(context, listen: listen);


class CaledarController extends ChangeNotifier {

  final cellCalendarPageController = CellCalendarPageController();
  Widget activeView = BuildMonthView();
  DateTime now = DateTime.now();
  DateTime day = DateTime.now();
  DateTime time = DateTime.now();
  GlobalKey<DayViewState>? state = new GlobalKey();
  EventController dayViewController = new EventController();

  // initDayView(){
  //   final event = CalendarEventData(
  //     date: DateTime(2022, 5, 27 ),
  //     startTime: ,
  //     event: "Event 1", title: 'dwadwadwa',
  //   );
  //   dayViewController.add(event);
  //
  // }

  nextDate(){

    var newDate = new DateTime(now.year, now.month + 1, now.day);
    now = newDate;
    cellCalendarPageController.animateToDate(newDate, duration: Duration(milliseconds: 200), curve:Curves.easeIn );
    notifyListeners();
  }


  showToday(){

    var newDate = new DateTime.now();
    now = newDate;
    cellCalendarPageController.animateToDate(newDate, duration: Duration(milliseconds: 200), curve:Curves.easeIn );
    notifyListeners();
  }

  prevDate(){

    var newDate = new DateTime(now.year, now.month - 1, now.day);
    now = newDate;
    cellCalendarPageController.animateToDate(newDate, duration: Duration(milliseconds: 200), curve:Curves.easeIn );
    notifyListeners();
  }

  setCalendarView(String type){

    if(type == "month"){

      activeView = BuildMonthView();

    }else if(type == "day"){
      activeView = BuildDayView();

    }else if(type == "week"){

    activeView = BuildWeekView();
    }
    notifyListeners();
  }


  nextDay(){
    var newDay = new DateTime(day.year, day.month, day.day + 1);
    state!.currentState!.animateToDate(newDay);
    day = newDay;
    notifyListeners();
  }
  prevDay(){
    var newDay = new DateTime(day.year, day.month, day.day - 1);
    state!.currentState!.animateToDate(newDay);
    day = newDay;
    notifyListeners();
  }


}


