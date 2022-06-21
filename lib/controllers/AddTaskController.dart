import 'package:cm_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AddTaskController addTaskController(context, {bool listen: true}) =>
    Provider.of<AddTaskController>(context, listen: listen);

class AddTaskController extends ChangeNotifier {

  var _title = TextEditingController();
  var _date = TextEditingController();
  var _startTime = TextEditingController();
  var _endTime = TextEditingController();
  var _location = TextEditingController();
  String SelectedDateAppointmnet = "";
  String SelectedTimeAppointmnet = "";

  TextEditingController get title => _title;
  TextEditingController get date => _date;
  TextEditingController get startTime => _startTime;
  TextEditingController get endTime => _endTime;
  TextEditingController get lcoation => _location;

  //attendess controllers
  var _name = TextEditingController();
  var _mobile = TextEditingController();
  var _email = TextEditingController();

  TextEditingController get name => _name;
  TextEditingController get mobile => _mobile;
  TextEditingController get email => _email;


  set name(value) {
    _name = value;
  }

  set location(value) {
    _location = value;
  }

  set startTime(value) {
    _startTime = value;
  }
  set endTime(value) {
    _endTime = value;
  }

  set date(value) {
    _date = value;
  }

  set title(value) {
    _title = value;
  }


  set mobile(value) {
    _mobile = value;
  }

  set email(value) {
    _email = value;
  }

  setDateOfAppointment(dateTime) async {
    String formatedDate = simplifyDateDMY(dateTime!,"dd/MM/y");
    SelectedDateAppointmnet = formatedDate;
    _date.text = SelectedDateAppointmnet;
    notifyListeners();
  }


  setTimeOfAppointment(dateTime,type) async {
    if(type == "start"){
      startTime.text = dateTime;
    }else{
      endTime.text = dateTime;
    }

    notifyListeners();
  }
}