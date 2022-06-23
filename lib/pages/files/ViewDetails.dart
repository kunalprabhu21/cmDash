
import 'package:cm_dashboard/controllers/TableController.dart';
import 'package:cm_dashboard/models/Report.dart';
import 'package:cm_dashboard/pages/FileTaskDetails.dart';
import 'package:cm_dashboard/pages/PhotoViewer.dart';
import 'package:cm_dashboard/pages/widgets/Badges.dart';
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

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
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
                  Text("Cooperative Societies",style: Theme.of(context).textTheme.headline1,),
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
                              Text('1',style: GoogleFonts.nunito(fontSize: 30,color: Constants.cardColorOpen,fontWeight: FontWeight.bold),),
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
                              Text('Complete',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
                              Text('Pending',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                              Text('30',style: GoogleFonts.nunito(fontSize: 30,color: Constants.cardColorlapsed,fontWeight: FontWeight.bold),),
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
                              Text('Closed',style: GoogleFonts.nunito(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
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
              controller.isLoading ? CircularProgressIndicator() :


              Text("List of OPEN files",style: Theme.of(context).textTheme.headline2,),
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
                              Badges(text: "File",colorValue:0xffff1493,),
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
                            children: [
                              Text("Attachments",style: GoogleFonts.nunito(fontSize: 15,color: Colors.grey,fontStyle: FontStyle.italic),),
                              Icon(Icons.attach_file,color: Colors.grey,size: 15,)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("images/pdf.png",height: 30,width: 30,),
                                  Text("Ramdas R Volvoikar.pdf",style: GoogleFonts.nunito(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w600),),
                                ],
                              ),
                              VerticalDivider(width: 10,color: Colors.amber,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("images/img.png",height: 30,width: 30,),
                                  Text("Ramdas R Volvoikar.png",style: GoogleFonts.nunito(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w600),),
                                ],
                              )

                              // SizedBox(width: 5,),
                              // Text("Ramdas R Volvoikar2.pdf",style: GoogleFonts.nunito(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w600),),


                            ],
                          ),
                          SizedBox(height: 40,),
                          RaisedButton(
                            child: Text("Add Comment", style: GoogleFonts.nunito(fontSize: 12,color: Colors.white)),
                            onPressed: (){
                              Navigator.of(context).pushReplacement(
                                  new MaterialPageRoute(builder: (context) => new FilesTaskDetails()));
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
                        padding: EdgeInsets.all(20),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Badges(text: "Pending",colorValue:0xffff0000,),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    push(context, PhotoViewer());
                                 },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset("images/pdf.png",height: 30,width: 30,),
                                      Text("Ramdas R Volvoikar.pdf",style: GoogleFonts.nunito(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                                VerticalDivider(width: 10,color: Colors.amber,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("images/img.png",height: 30,width: 30,),
                                    Text("Ramdas R Volvoikar.png",style: GoogleFonts.nunito(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w600),),
                                  ],
                                ),

                                // SizedBox(width: 5,),
                                // Text("Ramdas R Volvoikar2.pdf",style: GoogleFonts.nunito(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w600),),


                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xffededed)
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Me",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                                      Text("31/12/2022 3:23 PM",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(

                                    children: [
                                      Badges(text: "Xerox",colorValue:0xff808080,),
                                      SizedBox(width: 10,),
                                      Badges(text: "Close",colorValue:0xff808080,),
                                    ],
                                  )
                                  
                                ],
                              ),
                            )

                          ],
                        ),

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
