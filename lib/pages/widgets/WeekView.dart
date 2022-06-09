
import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/controllers/CalendarController.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BuildWeekView extends StatefulWidget {

  _BuildWeekViewState createState() => _BuildWeekViewState();
}

class _BuildWeekViewState extends State<BuildWeekView> {




  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<CaledarController>();
    return WeekView(

      controller: EventController(),
      eventTileBuilder: (date, events, boundry, start, end) {
        // Return your widget to display as event tile.
        return Container();
      },
      timeLineBuilder: (date){
        return Text(simplifyDateDMY(date,"hh:mm aa"),style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.right,);
      },
      showLiveTimeLineInAllDays: true,
      // To display live time line in all pages in week view.
      // width of week view.
      minDay: DateTime(1990),
      maxDay: DateTime(2050),
      initialDay: DateTime(2022),
      heightPerMinute: 2, // height occupied by 1 minute time span.
      eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
       // To change the first day of the week.
    );
  }



}

