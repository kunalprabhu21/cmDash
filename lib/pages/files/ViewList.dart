
import 'package:cm_dashboard/controllers/TableController.dart';
import 'package:cm_dashboard/models/Report.dart';
import 'package:cm_dashboard/pages/FilesDetails.dart';
import 'package:cm_dashboard/pages/files/ViewDetails.dart';

import 'package:cm_dashboard/users.dart';
import 'package:flutter/material.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class ViewList extends StatefulWidget {
  @override
  ViewListState createState() => ViewListState();
}

class ViewListState extends State<ViewList> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Open','Completed','Pending','Closed'];
  late List<Records> users;
  TableController controller1 = new TableController();
  @override
  void initState() {
    super.initState();
    tableController(context, listen: false).fetchTableData(context);
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
                  Text("Chief Minister's File Tracker",style: Theme.of(context).textTheme.headline1,),
                  Text("Last Updated On: 26 May 2022",style: Theme.of(context).textTheme.headline2,)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300,)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Open',style: GoogleFonts.nunito(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 40,color: Constants.cardColorOpen,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300,)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('In Time',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 40,color: Constants.cardColorinTime,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300,)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lapsed',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 40,color: Constants.cardColorlapsed,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300,)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Critical',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 40,color: Constants.cardColorCritical,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                    label: Text('Open'),
                    onSort: onSort,
                  ),DataColumn(
                    label: Text('Completed'),
                    onSort: onSort,
                  ),DataColumn(
                    label: Text('Pending'),
                    onSort: onSort,
                  ),DataColumn(
                    label: Text('Closed'),
                    onSort: onSort,
                  ),
                ],
                rows:controller.reportList.map(
                      (itemRow) => DataRow(
                    cells: [
                      DataCell(
                        Text(itemRow.id,style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                      ),

                      DataCell(
                        Text(itemRow.department,style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(builder: (context) => new FilesDetails()));
                        },
                      ),

                      DataCell(
                        Text(itemRow.open.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                        onTap: (){print(itemRow.id);},
                      ),

                      DataCell(
                        Text(itemRow.completed.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                        onTap: (){print(itemRow.id);},
                      ),

                      DataCell(
                        Text(itemRow.pending.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
                        onTap: (){print(itemRow.id);},
                      ),

                      DataCell(
                        Text(itemRow.closed.toString(),style: GoogleFonts.nunito(fontSize: 15,color: Colors.black),),
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
      controller1.reportList.sort((user1, user2) =>
          compareString(ascending, user1.id, user2.id));
    } else if (columnIndex == 1) {
      controller1.reportList.sort((user1, user2) =>
          compareString(ascending, user1.department, user2.department));
    } else if (columnIndex == 2) {
      controller1.reportList.sort((user1, user2) =>
          compareString(ascending, '${user1.open}', '${user2.open}'));
    } else if (columnIndex == 3) {
      controller1.reportList.sort((user1, user2) =>
          compareString(ascending, '${user1.completed}', '${user2.completed}'));
    } else if (columnIndex == 4) {
      controller1.reportList.sort((user1, user2) =>
          compareString(ascending, '${user1.pending}', '${user2.pending}'));
    } else if (columnIndex == 5) {
      controller1.reportList.sort((user1, user2) =>
          compareString(ascending, '${user1.closed}', '${user2.closed}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });

  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

}
