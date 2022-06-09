
import 'package:admin_panel_responsive_flutter/controllers/TableController.dart';
import 'package:admin_panel_responsive_flutter/models/Report.dart';
import 'package:admin_panel_responsive_flutter/pages/BudgetDetails.dart';

import 'package:admin_panel_responsive_flutter/pages/budget/ViewPage.dart';
import 'package:admin_panel_responsive_flutter/users.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class   ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Total','Completed','Pending','Closed'];
  late List<Records> users;
  TableController controller1 = new TableController();
  @override
  void initState() {
    super.initState();
    tableController(context, listen: false).fetchBudgetList(context);
  }

  @override
  Widget build(BuildContext context) {
    final controller = tableController(context);
    controller1 = controller;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Budget Assurances",style: Theme.of(context).textTheme.headline1,),
                  Text("Last Updated On: 26 May 2022",style: Theme.of(context).textTheme.headline2,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [

                  RaisedButton(
                    child: Text("All (3)", style: Theme.of(context).textTheme.bodyText2),
                    onPressed: (){

                    },
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    splashColor: Colors.grey,
                  ),
                  SizedBox(width: 5,),
                  RaisedButton(
                    child: Text("A (0)", style: Theme.of(context).textTheme.bodyText2),
                    onPressed: (){

                    },
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    splashColor: Colors.grey,
                  ),
                  SizedBox(width: 5,),
                  RaisedButton(
                    child: Text("B (1)", style: Theme.of(context).textTheme.bodyText2),
                    onPressed: (){

                    },
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    splashColor: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              controller.isLoading ? CircularProgressIndicator() :
              Card(
                child: DataTable(

                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  columns: <DataColumn>[
                    DataColumn(

                      label: Text('id'),
                      onSort: onSort,
                    ),
                    DataColumn(
                      label: Text('Department'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('Total'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('Delivered'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('With Govt'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('With Dept'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('Yet to Start'),
                      onSort: onSort,
                    )
                  ],
                  rows:controller.budgetList.map(
                        (itemRow) => DataRow(
                      cells: [
                        DataCell(
                          Text(itemRow.id,style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                        ),

                        DataCell(
                          Text(itemRow.department,style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BudgetDetails()));
                          },
                        ),

                        DataCell(
                          Text(itemRow.total.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),

                        DataCell(
                          Text(itemRow.delivered.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),

                        DataCell(
                          Text(itemRow.with_govt.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),

                        DataCell(
                          Text(itemRow.with_dept.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),
                        DataCell(
                          Text(itemRow.yet_to_start.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),

                      ],
                    ),
                  )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // List<DataColumn> getColumns(List<String> columns) => columns
  //     .map((String column) => DataColumn(
  //   label: Text(column + " (2)",style:GoogleFonts.nunito(fontSize: 18,color: Color(0xff1e224c),fontWeight: FontWeight.w600),),
  //   onSort: onSort,
  // )).toList();

  List<DataRow> getRows(List<Records> users) => users.map((Records user) {
    final cells = [user.id, user.department, user.open,user.completed,user.pending,user.closed];
    return DataRow(cells: getCells(cells),);
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data',style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),onTap: (){
        print(data.id);
      })).toList();


  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      controller1.budgetList.sort((user1, user2) =>
          compareString(ascending, user1.id, user2.id));
    } else if (columnIndex == 1) {
      controller1.budgetList.sort((user1, user2) =>
          compareString(ascending, user1.department, user2.department));
    } else if (columnIndex == 2) {
      controller1.budgetList.sort((user1, user2) =>
          compareString(ascending, '${user1.total}', '${user2.total}'));
    } else if (columnIndex == 3) {
      controller1.budgetList.sort((user1, user2) =>
          compareString(ascending, '${user1.delivered}', '${user2.delivered}'));
    } else if (columnIndex == 4) {
      controller1.budgetList.sort((user1, user2) =>
          compareString(ascending, '${user1.with_govt}', '${user2.with_govt}'));
    } else if (columnIndex == 5) {
      controller1.budgetList.sort((user1, user2) =>
          compareString(ascending, '${user1.with_dept}', '${user2.with_dept}'));
    }
    else if (columnIndex == 6) {
      controller1.budgetList.sort((user1, user2) =>
          compareString(ascending, '${user1.yet_to_start}', '${user2.yet_to_start}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });

  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
