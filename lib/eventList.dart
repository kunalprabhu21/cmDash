import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';

List<CalendarEvent> sampleEvents() {
  final today = DateTime.now();
  final sampleEvents = [
    CalendarEvent(
      eventDesc: "Metting with Bhushan",
        eventName: "New iPhone",
        eventDate: today.add(Duration(days: -42)),
        eventBackgroundColor: Colors.black),
    CalendarEvent(
      eventDesc: "dawdawd",
        eventName: "Writing test",
        eventDate: today.add(Duration(days: -30)),
        eventBackgroundColor: Colors.deepOrange),

  ];
  return sampleEvents;
}