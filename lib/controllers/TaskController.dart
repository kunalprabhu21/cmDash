

import 'package:cm_dashboard/models/Budget.dart';
import 'package:cm_dashboard/models/Report.dart';
import 'package:cm_dashboard/models/Task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TaskController taskController(context, {bool listen: true}) =>
    Provider.of<TaskController>(context, listen: listen);


class TaskController extends ChangeNotifier {
  bool _isLoading = true;
  List<Task> _taskList = [];
  List<Task> _taskSearchList = [];

  bool get isLoading => _isLoading;
  List<Task> get taskList => _taskList;

  set isLoading(bool value) {
    _isLoading = value;
    // notifyListeners();
  }

  void runFilterTask(String enteredKeyword) {

    List<Task> results = [];

    if (enteredKeyword.isEmpty) {
      results = _taskSearchList;
    } else {
      results = _taskSearchList
          .where((user) =>
          user.officers!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    _taskList = results;

    // Refresh the UI
    notifyListeners();

  }

  fetchTaskList(context){

    _isLoading = true;
    _taskList.clear();
    _taskSearchList.clear();
    Task task = new Task(id: "1", officers: "Laadli Laxmi", open: 1, complete: 0, close: 0);
    Task task2 = new Task(id: "1", officers: "Griha Aadhar", open: 2, complete: 1, close: 1);
    Task task3   = new Task(id: "1", officers: "DSSS", open: 2, complete: 0, close: 0);


    taskList.add(task);
    taskList.add(task2);
    taskList.add(task3);

    _taskSearchList.add(task);
    _taskSearchList.add(task2);
    _taskSearchList.add(task3);



    _isLoading = false;
    // notifyListeners();


  }

  addToDo(context,details){



  }



}