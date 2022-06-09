

import 'package:admin_panel_responsive_flutter/pages/BudgetList.dart';
import 'package:admin_panel_responsive_flutter/users.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel_responsive_flutter/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class HomeTablet extends StatefulWidget {
  @override
  _HomeTabletState createState() => _HomeTabletState();
}

class _HomeTabletState extends State<HomeTablet> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Open','Completed','Pending','Closed'];


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
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

                            margin: EdgeInsets.only(right: Constants.cardMargin),
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                                color: Color(0xff98d046),
                                borderRadius: BorderRadius.all(Radius.circular(Constants.cardBorders))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("FILES AND COMMUNICATION",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("5"),
                                    Text("5"),
                                    Text("5"),
                                  ],),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(

                                      decoration: BoxDecoration(


                                          color: Color(0xffffbf00),
                                          borderRadius: BorderRadius.all(Radius.circular(2))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                      child: Text("Central",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(


                                          color: Color(0xff2771c2),
                                          borderRadius: BorderRadius.all(Radius.circular(2))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                      child: Text("Files",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(


                                          color: Color(0xff959595),
                                          borderRadius: BorderRadius.all(Radius.circular(2))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                      child: Text("Issues",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ),

                      Expanded(
                        child: Container(

                            margin: EdgeInsets.only(right: Constants.cardMargin),
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                                color: Color(0xff6d31a2),
                                borderRadius: BorderRadius.all(Radius.circular(Constants.cardBorders))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("COURT CASES",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("5"),
                                    Text("5"),
                                    Text("5"),
                                  ],),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(

                                      decoration: BoxDecoration(


                                          color: Color(0xffffbf00),
                                          borderRadius: BorderRadius.all(Radius.circular(2))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                      child: Text("Supreme Court",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(


                                          color: Color(0xff2771c2),
                                          borderRadius: BorderRadius.all(Radius.circular(2))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                      child: Text("Files",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(


                                          color: Color(0xff959595),
                                          borderRadius: BorderRadius.all(Radius.circular(2))
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                      child: Text("Issues",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                    )
                                  ],
                                )
                              ],
                            )
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context)..push(
                                new MaterialPageRoute(builder: (context) => new BudgetList()));
                          },
                          child: Container(

                              margin: EdgeInsets.only(right: Constants.cardMargin),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xff2771c2),
                                  borderRadius: BorderRadius.all(Radius.circular(Constants.cardBorders))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("BUDGET AND ASSURANCES",style: GoogleFonts.nunito(fontSize: 16,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Text("5"),
                                      Text("5"),
                                      Text("5"),
                                    ],),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(

                                        decoration: BoxDecoration(


                                            color: Color(0xffffbf00),
                                            borderRadius: BorderRadius.all(Radius.circular(2))
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                        child: Text("Central",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(


                                            color: Color(0xff2771c2),
                                            borderRadius: BorderRadius.all(Radius.circular(2))
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                        child: Text("Files",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(


                                            color: Color(0xff959595),
                                            borderRadius: BorderRadius.all(Radius.circular(2))
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                        child: Text("Issues",style: GoogleFonts.nunito(fontSize: 12,fontWeight: FontWeight.w500),),
                                      )
                                    ],
                                  )
                                ],
                              )
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                color: Colors.white,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Marquee(
                  style: GoogleFonts.nunito(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xff9358a4)),
                  text:"Decide on IIT land. *Call meeting of industries*",
                  velocity: 50.0,
                ),
              ),
              SizedBox(height: 10,),
              Row(
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
                          Text("APPOINTMENTS",style: GoogleFonts.nunito(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
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

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}
