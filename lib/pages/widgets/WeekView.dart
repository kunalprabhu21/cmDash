
import 'package:calendar_view/calendar_view.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/Event.dart';

DateTime get _now => DateTime.now();
class BuildWeekView extends StatefulWidget {

  _BuildWeekViewState createState() => _BuildWeekViewState();
}

class _BuildWeekViewState extends State<BuildWeekView> {
  List<CalendarEventData<Event>> _events = [
    CalendarEventData(
      date: _now,
      event: Event(title: "Joe's Birthday"),
      title: "Project meeting",
      description: "Today is project meeting.",
      startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
      endTime: DateTime(_now.year, _now.month, _now.day, 22),
    ),
    CalendarEventData(
      date: _now.add(Duration(days: 1)),
      startTime: DateTime(_now.year, _now.month, _now.day, 18),
      endTime: DateTime(_now.year, _now.month, _now.day, 19),
      event: Event(title: "Wedding anniversary"),
      title: "Wedding anniversary",
      description: "Attend uncle's wedding anniversary.",
    ),
    CalendarEventData(
      date: _now,
      startTime: DateTime(_now.year, _now.month, _now.day, 14),
      endTime: DateTime(_now.year, _now.month, _now.day, 17),
      event: Event(title: "Football Tournament"),
      title: "Football Tournament",
      description: "Go to football tournament.",
    ),
    CalendarEventData(
      date: _now.add(Duration(days: 3)),
      startTime: DateTime(_now.add(Duration(days: 3)).year,
          _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
      endTime: DateTime(_now.add(Duration(days: 3)).year,
          _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
      event: Event(title: "Sprint Meeting."),
      title: "Sprint Meeting.",
      description: "Last day of project submission for last year.",
    ),
    CalendarEventData(
      date: _now.subtract(Duration(days: 2)),
      startTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          14),
      endTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          16),
      event: Event(title: "Team Meeting"),
      title: "Team Meeting",
      description: "Team Meeting",
    ),
    CalendarEventData(
      date: _now.subtract(Duration(days: 2)),
      startTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          10),
      endTime: DateTime(
          _now.subtract(Duration(days: 2)).year,
          _now.subtract(Duration(days: 2)).month,
          _now.subtract(Duration(days: 2)).day,
          12),
      event: Event(title: "Chemistry Viva"),
      title: "Chemistry Viva",
      description: "Today is Joe's birthday.",
    ),
  ];


  EventController eventController = new EventController();

  @override
  void initState() {
    super.initState();
    eventController.addAll(_events);
  }


  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<CaledarController>();
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return WeekView(


      key: controllerCalendar.Weekstate,
      weekTitleHeight: 20,
      weekDayBuilder: (date){
        return Center(child: Text(simplifyDateDMY(date,"dd MMM y"),style: GoogleFonts.nunito(color: Colors.black),));
      },
      timeLineBuilder: (date){
        return Text(simplifyDateDMY(date,"hh:mm aa"),style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.right,);
      },

      controller: eventController,

      showLiveTimeLineInAllDays: true, // To display live time line in all pages in week view.// width of week view.
      minDay: DateTime(1990),
      maxDay: DateTime(2050),
      initialDay:date,
      heightPerMinute: 1, // height occupied by 1 minute time span.
       // To define how simultaneous events will be arranged.
      onEventTap: (events, date) => print(events),
      onDateLongPress: (date) => print(date),
// To change the first day of the week.
    );
  }



}

