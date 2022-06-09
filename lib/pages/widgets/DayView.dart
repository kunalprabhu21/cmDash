
import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:admin_panel_responsive_flutter/controllers/CalendarController.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BuildDayView extends StatefulWidget {

  _BuildDayViewState createState() => _BuildDayViewState();
}

class _BuildDayViewState extends State<BuildDayView> {




  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<CaledarController>();
    return DayView(

        key: controllerCalendar.state,

        hourIndicatorSettings: HourIndicatorSettings(color: Colors.grey),
        dayTitleBuilder: (date){
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                    controllerCalendar.prevDay();
                  },
                  child: Icon(Icons.arrow_back_ios)),
              Container(height: 50,child: Center(child: Text(simplifyDateDMY(controllerCalendar.day,"dd MMM y"),style: Theme.of(context).textTheme.headline1,),),),
              GestureDetector(
                  onTap: (){
                    controllerCalendar.nextDay();
                  },
                  child: Icon(Icons.arrow_forward_ios)),
            ],
          );
        },
        timeLineBuilder: (date){
          return Text(simplifyDateDMY(date,"hh:mm aa"),style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.right,);
        },
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        controller: controllerCalendar.dayViewController,
        eventTileBuilder: (date, events, boundry, start, end) {
          // Return your widget to display as event tile.
          return Container();
        },
        showVerticalLine: true, // To display live time line in day view.
        showLiveTimeLineInAllDays: true, // To display live time line in all pages in day view.
        heightPerMinute: 1, // height occupied by 1 minute time span.
        eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
        onEventTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date)
    );
  }



}

