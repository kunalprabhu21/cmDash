import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';

List<CalendarEvent> sampleEvents() {
  final today = DateTime.now();
  final sampleEvents = [
    CalendarEvent(

        eventName: "New iPhone",
        eventDate: today.add(Duration(days: -42)),
        eventBackgroundColor: Colors.black),
    CalendarEvent(

        eventName: "New iPhone2",
        eventDate: today.add(Duration(days: -42)),
        eventBackgroundColor: Colors.black),
    CalendarEvent(

        eventName: "New iPhone3",
        eventDate: today.add(Duration(days: -42)),
        eventBackgroundColor: Colors.black),
    CalendarEvent(

        eventName: "Writing test",
        eventDate: today.add(Duration(days: -30)),
        eventBackgroundColor: Colors.deepOrange),

  ];
  return sampleEvents;
}