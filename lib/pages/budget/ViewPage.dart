
import 'package:cm_dashboard/controllers/TableController.dart';
import 'package:cm_dashboard/models/Report.dart';
import 'package:cm_dashboard/pages/widgets/Badges.dart';
import 'package:cm_dashboard/pages/widgets/CustomDialog.dart';
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

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Total','Completed','Pending','Closed'];
  late List<Records> users;
  TableController controller1 = new TableController();
  @override
  void initState() {
    super.initState();

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
                              Text('Department',style: GoogleFonts.nunito(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('Archives',style: GoogleFonts.nunito(fontSize: 30,color: Constants.cardColorOpen,fontWeight: FontWeight.bold),),
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
                              Text('Total',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 30,color: Constants.cardColorinTime,fontWeight: FontWeight.bold),),
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
                              Text('Delivered',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 30,color: Constants.cardColorlapsed,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),

                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300,)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('In Progress',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Divider(color: Colors.grey,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text("With Govt",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),),
                                      Text("2",style: GoogleFonts.nunito(fontSize: 20,color: Constants.cardColorlapsed,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("With Dept",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),),
                                      Text("2",style: GoogleFonts.nunito(fontSize: 20,color: Constants.cardColorlapsed,fontWeight: FontWeight.bold),),
                                    ],
                                  )
                                ],
                              )
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
                              Text('Yet to Start',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 30,color: Constants.cardColorlapsed,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // controller.isLoading ? CircularProgressIndicator() :


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
                              Container(

                                child: Text("Para no : 127",style: GoogleFonts.nunito(fontSize: 13,fontWeight: FontWeight.bold),),
                                decoration: BoxDecoration(
                                  color: Color(0xfff39c12),
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                              ),
                              Text("Due Date : 31/12/2022",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text("Take up the unit project to facilitate the research scholors of indexing",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                          SizedBox(height: 10,),
                          Text("Financial Implications: Rs 4.00 Lakh",style: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
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


                        ],
                      ),

                    ),

                    Expanded(
                      child: Container(

                        width: MediaQuery.of(context).size.width/2,
                        padding: EdgeInsets.all(20),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Container(

                                  child: Text("Delivered",style: GoogleFonts.nunito(fontSize: 13,fontWeight: FontWeight.bold),),
                                  decoration: BoxDecoration(
                                    color: Color(0xff00cc00),
                                    borderRadius: BorderRadius.circular(5),

                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                ),
                                Text("07/02/2017 2:16 PM",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Dr. Y.Durga Prasad",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                            SizedBox(height: 10,),
                            ReadMoreText(
                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)',
                          trimLines: 2,

                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.orangeAccent),
                          lessStyle: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.orangeAccent),
                        ),

                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RaisedButton(
                                  child: Text("Add Comment", style: GoogleFonts.nunito(fontSize: 12,color: Colors.white)),
                                  onPressed: (){
                                    customDialog(
                                      context,Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Take up a unit project to facilitate the research scholars of indexing, transcribing and preparing summaries of Modi-Marathi and Persian records'),
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
                                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                                          splashColor: Colors.grey,
                                        ),
                                      ],
                                    ),"Adding comment towards Para No : 136");

                                  },
                                  color: Color(0xff00a65a),
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  splashColor: Colors.grey,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    customDialog(
                                        context,Container(
                                      width: MediaQuery.of(context).size.width / 2,
                                          child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                          return Divider(color: Colors.grey,);
                                      },
                                      shrinkWrap: true,
                                      itemCount: 20,
                                      itemBuilder: (BuildContext context, int index) {
                                          return ListTile(
                                            title: CommentsList(),
                                          );
                                      },
                                    ),
                                        ),"Comment towards Para No : 136");
                                  },
                                    child: Text("View all Comments",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),)),

                              ],
                            ),

                          ],
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

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

  Widget CommentsList(){

    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Badges(text: "Complete", colorValue: 0xff30d480),
                SizedBox(width: 10,),
                Text("Dr. Ram Prasad Naik",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
              ],
            ),
            Text("21/05/2015 3:15PM")
          ],
        ),
        SizedBox(height: 20,),
        ReadMoreText(
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)',
          trimLines: 2,

          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.orangeAccent),
          lessStyle: GoogleFonts.nunito(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.orangeAccent),
        ),
        SizedBox(height: 20,),
      ],
    );
  }

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
