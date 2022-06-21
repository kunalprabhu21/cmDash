
import 'package:calendar_view/calendar_view.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class BuildWeekView extends StatefulWidget {

  _BuildWeekViewState createState() => _BuildWeekViewState();
}

class _BuildWeekViewState extends State<BuildWeekView> {




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

      controller: EventController(),

      eventTileBuilder: (date, events, boundry, start, end) {
        // Return your widget to display as event tile.
        return Container();
      },
      showLiveTimeLineInAllDays: true, // To display live time line in all pages in week view.// width of week view.
      minDay: DateTime(1990),
      maxDay: DateTime(2050),
      initialDay:date,
      heightPerMinute: 1, // height occupied by 1 minute time span.
      eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
      onEventTap: (events, date) => print(events),
      onDateLongPress: (date) => print(date),
// To change the first day of the week.
    );
  }



}

