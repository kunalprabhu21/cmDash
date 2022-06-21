
import 'package:cm_dashboard/controllers/TableController.dart';
import 'package:cm_dashboard/controllers/TaskController.dart';
import 'package:cm_dashboard/models/Report.dart';
import 'package:cm_dashboard/pages/BudgetDetails.dart';

import 'package:cm_dashboard/pages/budget/ViewPage.dart';
import 'package:cm_dashboard/pages/widgets/Badges.dart';
import 'package:cm_dashboard/users.dart';
import 'package:flutter/material.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class   TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Total','Completed','Pending','Closed'];
  late List<Records> users;
  TaskController controller1 = new TaskController();
  @override
  void initState() {
    super.initState();
    taskController(context, listen: false).fetchTaskList(context);
  }

  @override
  Widget build(BuildContext context) {
    final controller = taskController(context);
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
                  Text("Task Tracker",style: Theme.of(context).textTheme.headline1,),
                  Text("Last Updated On: 26 May 2022",style: Theme.of(context).textTheme.headline2,)
                ],
              ),
              SizedBox(height: 20,),
              SizedBox(height: 10,),
              controller.isLoading ? CircularProgressIndicator() :
              TextField(
                  onChanged: (value) => controller!.runFilterTask(value),
                  decoration: InputDecoration(

                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search here",
                      contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, right: 50.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(26),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                        borderRadius: BorderRadius.circular(26),
                      ))),
              SizedBox(height: 10,),
              Card(
                child: DataTable(

                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text('Officer'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('Open'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('Complete'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('Close'),
                      onSort: onSort,
                    ),DataColumn(
                      label: Text('Action'),
                      onSort: onSort,
                    )
                  ],
                  rows:controller.taskList.map(
                        (itemRow) => DataRow(
                      cells: [

                        DataCell(
                          Text(itemRow.officers,style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BudgetDetails()));
                          },
                        ),

                        DataCell(
                          Text(itemRow.open.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),

                        DataCell(
                          Text(itemRow.complete.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),

                        DataCell(
                          Text(itemRow.close.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                          onTap: (){print(itemRow.id);},
                        ),


                        DataCell(
                          Badges(text: "Add Task", colorValue: 0xff00b0f0),
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
      controller1.taskList.sort((user1, user2) =>
          compareString(ascending, user1.officers, user2.officers));
    } else if (columnIndex == 1) {
      controller1.taskList.sort((user1, user2) =>
          compareString(ascending, '${user1.open}', '${user2.open}'));
    } else if (columnIndex == 2) {
      controller1.taskList.sort((user1, user2) =>
          compareString(ascending, '${user1.complete}', '${user2.complete}'));
    } else if (columnIndex == 3) {
      controller1.taskList.sort((user1, user2) =>
          compareString(ascending, '${user1.complete}', '${user2.complete}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });

  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
