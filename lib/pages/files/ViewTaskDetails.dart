
import 'package:cm_dashboard/controllers/CmActionController.dart';
import 'package:cm_dashboard/controllers/TableController.dart';
import 'package:cm_dashboard/models/Report.dart';
import 'package:cm_dashboard/models/Status.dart';
import 'package:cm_dashboard/pages/widgets/CustomRadioButton.dart';
import 'package:cm_dashboard/users.dart';
import 'package:flutter/material.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class ViewTaskDetails extends StatefulWidget {
  @override
  _ViewTaskDetailsState createState() => _ViewTaskDetailsState();
}

class _ViewTaskDetailsState extends State<ViewTaskDetails> {
  int? sortColumnIndex;
  bool isAscending = false;

  final columns = ['id', 'Department', 'Total','Completed','Pending','Closed'];
  final list = ['id', 'Department', 'Total','Completed','Pending','Closed'];
  late List<Records> users;
  late List<RadioModel> getStatusList;
  late List<RadioModel> getXeroxList;
  late List<RadioModel> getRTPList;
  TableController controller1 = new TableController();
  String radioButtonValueAction = "1";
  String radioButtonValueXerox = "1";
  String radioButtonValueRTP = "1";

  @override
  void initState() {
    super.initState();
    cmActionController(context, listen: false).initView();
    getStatusList = getStatus()!;
    getXeroxList = getXerox()!;
    getRTPList = getRTP()!;
  }





  @override
  Widget build(BuildContext context) {
    final controller = tableController(context);
    final controllerCmAction = cmActionController(context);
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
                  Text("Cooperative Societies",style: Theme.of(context).textTheme.headline1,),
                  Text("Last Updated On: 26 May 2022",style: Theme.of(context).textTheme.headline2,)
                ],
              ),


              SizedBox(height: 20,),
              controller.isLoading ? CircularProgressIndicator() :
              SizedBox(height: 10,),
              Card(
                shape: Border(left: BorderSide(color: Color(0xfff39c12), width: 4)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(20),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("Take up the unit project to facilitate the research scholors of indexing",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                              Text("Due Date : 31/12/2022",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                            ],
                          ),


                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("ID:20170518-004",style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                              SizedBox(width: 5,),
                              Container(

                                child: Text("File",style: GoogleFonts.nunito(fontSize: 13,fontWeight: FontWeight.bold),),
                                decoration: BoxDecoration(
                                  color: Color(0xffff1493),
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 5,),
                              Text("Blosson Sofia A. Periera",style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                              SizedBox(width: 10,),
                              Icon(Icons.phone,color: Colors.green,),
                              SizedBox(width: 5,),
                              Text("9822135847",style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                              SizedBox(width: 10,),
                              Icon(Icons.email_outlined,color: Colors.orangeAccent,),
                              SizedBox(width: 5,),
                              Text("testme@gmail.com",style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(color: Color(0xffededed),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ACTION",style: GoogleFonts.nunito(color: Colors.black),),
                              Row(

                                children: [

                                  for(RadioModel item in getStatusList) GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        controllerCmAction.handleVisibility(item.getName.toString());

                                        radioButtonValueAction = item.getId.toString();


                                      });
                                    },
                                    child: MyRadioListTile(text: item.getName.toString(),id: item.getId.toString(),activeIndex: radioButtonValueAction,lastBorderIndex: getStatusList.length,
                                  ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Visibility(
                            visible: controllerCmAction.showReassignRow,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("REASSIGN",style: GoogleFonts.nunito(color: Colors.black),),
                                    Row(

                                      children: [

                                        Container(
                                          child: GestureDetector(

                                              child: Text(controllerCmAction.SelectedDateExtend!,style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.black,),),
                                                  onTap: (){

                                                    controllerCmAction.openDatePicker(context,"extend");

                                                  },

                                          ),

                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                // SizedBox(height: 10,),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: controllerCmAction.showExtendRow,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("EXTEND",style: GoogleFonts.nunito(color: Colors.black),),
                                    Row(

                                      children: [

                                        Container(
                                          child: GestureDetector(

                                            child: Text(controllerCmAction.SelectedDateReassign!,style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.black,),),
                                            onTap: (){

                                              controllerCmAction.openDatePicker(context,"reassign");

                                            },

                                          ),

                                        )
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("XEROX",style: GoogleFonts.nunito(color: Colors.black),),
                              Row(
                                children: [

                                  for(RadioModel item in getXeroxList) GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        radioButtonValueXerox = item.getId.toString();

                                      });
                                    },
                                    child: MyRadioListTile(text: item.getName.toString(),id: item.getId.toString(),activeIndex: radioButtonValueXerox,lastBorderIndex: getXeroxList.length,
                                  ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("REPLY TO PARTY",style: GoogleFonts.nunito(color: Colors.black),),
                              Row(
                                children: [

                                  for(RadioModel item in getRTPList) GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        radioButtonValueRTP = item.getId.toString();

                                      });
                                    },
                                    child: MyRadioListTile(text: item.getName.toString(),id: item.getId.toString(),activeIndex: radioButtonValueRTP,lastBorderIndex: getRTPList.length,
                                  ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          TextField(

                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(color:Color(0xff1e224c)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(5.0),
                                ),
                                borderSide:
                                const BorderSide(color:Color(0xff1e224c)),
                              ),
                              hintText: "Comment",

                              // Added this
                              contentPadding: EdgeInsets.all(17), // Added this
                            ),
                          ),
                          SizedBox(height: 10,),
                          RaisedButton(
                            child: Text("Submit", style: GoogleFonts.nunito(fontSize: 12,color: Colors.white)),
                            onPressed: (){

                            },
                            color: Color(0xff00a65a),
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            splashColor: Colors.grey,
                          ),
                        ],
                      ),

                    ),

                    Expanded(
                      child: Container(

                        width: MediaQuery.of(context).size.width/2,


                      ),
                    ),
                  ],
                ),
              ),

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
