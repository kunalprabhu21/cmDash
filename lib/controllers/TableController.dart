

import 'package:admin_panel_responsive_flutter/models/Budget.dart';
import 'package:admin_panel_responsive_flutter/models/Report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TableController tableController(context, {bool listen: true}) =>
    Provider.of<TableController>(context, listen: listen);


class TableController extends ChangeNotifier {
  bool _isLoading = true;
  List<Records> _reportList = [];
  List<Budget> _budgetList = [];

  bool get isLoading => _isLoading;
  List<Records> get reportList => _reportList;
  List<Budget> get budgetList => _budgetList;

  set isLoading(bool value) {
    _isLoading = value;
    // notifyListeners();
  }


  fetchTableData(context){

    _isLoading = true;
    reportList.clear();
    Records records = new Records(id: "1", department: "PWD", open: 2, completed: 4, pending: 12, closed: 45);
    Records records1 = new Records(id: "2", department: "Cost", open: 12, completed: 34, pending: 12, closed: 45);
    reportList.add(records);
    reportList.add(records1);
    _isLoading = false;
    // notifyListeners();


  }

  fetchBudgetList(context){

    _isLoading = true;
    budgetList.clear();
    Budget records = new Budget(id: "1", department: "Captain of Ports", total: 3, delivered: 2, with_govt: 1, with_dept: 1, yet_to_start: 0);
    Budget records1 = new Budget(id: "2", department: "Civil Supplies", total: 2, delivered: 1, with_govt: 1, with_dept: 0, yet_to_start: 0);
    Budget records2 = new Budget(id: "3", department: "Civil Aviation", total: 5, delivered: 2, with_govt: 2, with_dept: 1, yet_to_start: 0);


    budgetList.add(records);
    budgetList.add(records1);
    budgetList.add(records2);
    _isLoading = false;
    // notifyListeners();


  }



}