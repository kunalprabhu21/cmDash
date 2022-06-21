import 'package:cm_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

CmActionController cmActionController(context, {bool listen: true}) =>
    Provider.of<CmActionController>(context, listen: listen);

class CmActionController extends ChangeNotifier {

  bool _showExtendRow = false;
  bool _showReassignRow = false;
  DateTime? currentDate = DateTime.now();
  String SelectedDateExtend = "";
  String SelectedDateReassign = "";

  set showExtendRow(bool value) {
    _showExtendRow = value;
    // notifyListeners();
  }
  set showReassignRow(bool value) {
    _showReassignRow = value;
    // notifyListeners();
  }
  bool get showExtendRow => _showExtendRow;
  bool get showReassignRow => _showReassignRow;

  void initView(){

    String formatedDate = simplifyDateDMY(currentDate!,"dd/MM/y");
    SelectedDateExtend = formatedDate;
    SelectedDateReassign = formatedDate;
    notifyListeners();
  }

  void handleVisibility(String action){
    if(action == "REASSIGN"){
      showReassignRow = true;
      showExtendRow = false;
    }else if(action == "EXTEND"){
      showExtendRow = true;
      showReassignRow = false;
    }else{
      showExtendRow = false;
      showReassignRow = false;
    }
      notifyListeners();
  }

  void openDatePicker(context,type) async {
    final dateTime = await selectDate(context,type);
    String formatedDate = simplifyDateDMY(dateTime!,"dd/MM/y");
    if(type == "extend"){
      SelectedDateExtend = formatedDate;
    }else{
      SelectedDateReassign = formatedDate;
    }

    notifyListeners();

  }
}