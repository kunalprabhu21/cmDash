
import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:cm_dashboard/eventList.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:cell_calendar/cell_calendar.dart';

import 'package:provider/provider.dart';


class BuildMonthView extends StatelessWidget {
  final bool showHomeIcon;
  final bool showAddress;
  final String title;
  final Function? onPop;
  bool disableActionButton;
  final labels = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  BuildMonthView({this.showHomeIcon = false,this.onPop,this.disableActionButton = false,this.title = "",this.showAddress = false});

  @override
  Widget build(BuildContext context) {
    final _sampleEvents = sampleEvents();
    final controllerCalendar = context.watch<CaledarController>();
    return CellCalendar(
      events: _sampleEvents,
        daysOfTheWeekBuilder: (dayIndex) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              labels[dayIndex],
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
          );
        },
      onCellTapped: (date) {
        final eventsOnTheDate = _sampleEvents.where((event) {
          final eventDate = event.eventDate;
          return eventDate.year == date.year &&
              eventDate.month == date.month &&
              eventDate.day == date.day;
        }).toList();
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title:
              Text(date.month.monthName + " " + date.day.toString()),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: eventsOnTheDate
                    .map(
                      (event) => Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.only(bottom: 12),
                    color: event.eventBackgroundColor,
                    child: Text(
                      event.eventName,
                      style: TextStyle(color: event.eventTextColor),
                    ),
                  ),
                )
                    .toList(),
              ),
            ));
      },
      cellCalendarPageController: controllerCalendar.cellCalendarPageController,
      dateTextStyle: Theme.of(context).textTheme.headline2,
      monthYearLabelBuilder: (datetime) {
        final year = datetime!.year.toString();
        final month = datetime.month.monthName;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Text(
                ""),
              const Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  controllerCalendar.cellCalendarPageController.animateToDate(
                    DateTime.now(),
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 300),
                  );
                },
              )
            ],
          ),
        );
      },

      onPageChanged: (firstDate, lastDate) {
        /// Called when the page was changed
        /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
      },
    );
  }
}
