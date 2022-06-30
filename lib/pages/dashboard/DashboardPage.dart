

import 'package:cm_dashboard/pages/BudgetList.dart';
import 'package:cm_dashboard/pages/Files.dart';
import 'package:cm_dashboard/pages/Tasks.dart';
import 'package:cm_dashboard/pages/todo/TodoList.dart';
import 'package:cm_dashboard/pages/widgets/CustomCards.dart';
import 'package:cm_dashboard/routes.dart';
import 'package:cm_dashboard/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'dart:html' as html;
class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Open','Completed','Pending','Closed'];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding),
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
              SizedBox(height: Constants.SizedBoxHeight,),
              Container(
                child: SingleChildScrollView(
                  child: Row(
                    children: [

                      CustomCards(title: "FILE AND COMMUNICATIONS",route:new FileMain(),cardColor:Color(0xff98d046) ,),
                      CustomCards(title: "COURT CASES",route:new TaskMain(),cardColor: Color(0xff6d31a2),),
                      CustomCards(title: "BUDGET AND ASSURANCES",route:new BudgetList(),cardColor: Color(0xff2771c2),),

                    ],
                  ),
                ),
              ),
              SizedBox(height: Constants.SizedBoxHeight,),
              Container(
                color: Colors.white,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Marquee(
                      style: GoogleFonts.nunito(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xff9358a4)),
                      text:"Decide on IIT land. *Call meeting of industries*",
                      velocity: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(

                        color: Colors.lightBlue,
                        width: 80,
                        height: 50,
                        child: Center(child: Text("TODO's")),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: Constants.SizedBoxHeight,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("APPOINTMENTS",style: Theme.of(context).textTheme.headline2),
                          Divider(color: Colors.grey,),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                    SizedBox(height: 5,),
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Text("5:15 PM ",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                        Expanded(child: Text("Entertainment Society of Goa - Panjim",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),)),
                                      ],
                                    ),
                                    Divider(color: Color(0xffededed),),
                                  ],
                                ),
                                Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                    SizedBox(height: 5,),
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Text("5:15 PM ",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                        Text("Entertainment Society of Goa - Panjim",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                                      ],
                                    ),
                                    Divider(color: Color(0xffededed),),
                                  ],
                                ),
                                Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                    SizedBox(height: 5,),
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Text("5:15 PM ",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                        Text("Entertainment Society of Goa - Panjim",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                                      ],
                                    ),
                                    Divider(color: Color(0xffededed),),
                                  ],
                                ),
                                Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.grey),),
                                    SizedBox(height: 5,),
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Text("5:15 PM ",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                        Text("Entertainment Society of Goa - Panjim",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),),
                                      ],
                                    ),
                                    Divider(color: Color(0xffededed),),
                                  ],
                                )
                              ],// use it
                            ),
                          )
                        ],
                      ),
                    ),

                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: TodoList()
                    ),

                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}
