

import 'package:cm_dashboard/controllers/AddTaskController.dart';
import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:cm_dashboard/controllers/MenuController.dart';
import 'package:cm_dashboard/pages/BudgetList.dart';
import 'package:cm_dashboard/pages/Files.dart';
import 'package:cm_dashboard/pages/Tasks.dart';
import 'package:cm_dashboard/pages/widgets/Badges.dart';
import 'package:cm_dashboard/pages/widgets/CustomButtons.dart';
import 'package:cm_dashboard/pages/widgets/CustomCards.dart';
import 'package:cm_dashboard/pages/widgets/CustomDialog.dart';
import 'package:cm_dashboard/pages/widgets/CustomTextfield.dart';
import 'package:cm_dashboard/users.dart';
import 'package:flutter/material.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class Todo {
  String name;
  bool enable;
  Todo({this.enable = true, required this.name});
}

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  int? sortColumnIndex;
  bool isAscending = false;
  final columns = ['id', 'Department', 'Open','Completed','Pending','Closed'];
  ScrollController? controller;
  ScrollController? controller2;
  final items = ['Do not repeat', 'Daily', 'Weekly', 'Monthly','Anually'];
  String selectedValue = 'Do not repeat';

  @override
  void initState() {
    super.initState();

  }

   openDatePicker() async {
     final dateTime = await selectDate(context,"appointmentDate");
     addTaskController(context, listen: false).setDateOfAppointment(dateTime);
  }

  openStartTimePicker() async {
    final dateTime = await selectTime(context,"start");
    addTaskController(context, listen: false).setTimeOfAppointment(dateTime,"start");
  }
  openEndTimePicker() async {
    final dateTime = await selectTime(context,"end");
    addTaskController(context, listen: false).setTimeOfAppointment(dateTime,"end");
  }

  @override
  Widget build(BuildContext context) {
    final controllerTask = context.watch<AddTaskController>();

    Widget? addAttendessLayout(){

        return Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Wrap(
            children: [
              SizedBox(height: Constants.SizedBoxHeight,),
              Text("Select Type",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
              Container(
                margin: EdgeInsets.only(top: 10,right: 10),
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1.5),
                    borderRadius: new BorderRadius.all(Radius.circular(5.0))
                ),

                child:  DropdownButton<String>(
                  isExpanded: true,
                  value: selectedValue,
                  onChanged: (String? newValue) =>
                      setState(() => selectedValue = newValue!),
                  items: items
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,

                        child: Text(value),
                      ))
                      .toList(),

                  // add extra sugar..
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  underline: SizedBox(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Department",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),

                          Container(
                            margin: EdgeInsets.only(top: 10,right: 10),
                            padding: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 44,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1.5),
                                borderRadius: new BorderRadius.all(Radius.circular(5.0))
                            ),

                            child:  DropdownButton<String>(
                              isExpanded: true,
                              value: selectedValue,
                              onChanged: (String? newValue) =>
                                  setState(() => selectedValue = newValue!),
                              items: items
                                  .map<DropdownMenuItem<String>>(
                                      (String value) => DropdownMenuItem<String>(
                                    value: value,

                                    child: Text(value),
                                  ))
                                  .toList(),

                              // add extra sugar..
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              underline: SizedBox(),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Office",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),

                          Container(
                            margin: EdgeInsets.only(top: 10,right: 10),
                            padding: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 44,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1.5),
                                borderRadius: new BorderRadius.all(Radius.circular(5.0))
                            ),

                            child:  DropdownButton<String>(
                              isExpanded: true,
                              value: selectedValue,
                              onChanged: (String? newValue) =>
                                  setState(() => selectedValue = newValue!),
                              items: items
                                  .map<DropdownMenuItem<String>>(
                                      (String value) => DropdownMenuItem<String>(
                                    value: value,

                                    child: Text(value),
                                  ))
                                  .toList(),

                              // add extra sugar..
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              underline: SizedBox(),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Officer",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),

                          Container(
                            margin: EdgeInsets.only(top: 10,right: 10),
                            padding: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 44,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey,width: 1.5),
                                borderRadius: new BorderRadius.all(Radius.circular(5.0))
                            ),

                            child:  DropdownButton<String>(
                              isExpanded: true,
                              value: selectedValue,
                              onChanged: (String? newValue) =>
                                  setState(() => selectedValue = newValue!),
                              items: items
                                  .map<DropdownMenuItem<String>>(
                                      (String value) => DropdownMenuItem<String>(
                                    value: value,

                                    child: Text(value),
                                  ))
                                  .toList(),

                              // add extra sugar..
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              underline: SizedBox(),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(child: CustomTextField("Name", "Name", Colors.grey, Colors.grey, Colors.grey, controllerTask.name)),
                  Expanded(child: CustomTextField("Mobile", "Mobile", Colors.grey, Colors.grey, Colors.grey, controllerTask.mobile)),
                  Expanded(child: CustomTextField("Email", "Email", Colors.grey, Colors.grey, Colors.grey, controllerTask.email))
                ],
              ),
              // SizedBox(height: Constants.SizedBoxHeight,),
              Row(
                children: [
                  CustomButtons().customElevatedButton("Save",Colors.green)!,
                  SizedBox(width: 10,),
                  CustomButtons().customElevatedButton("Save & Add More",Colors.orangeAccent)!,
                ],
              )
            ],
          ),
        );
    }

    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add Appointment",style: Theme.of(context).textTheme.headline1,),
            Text("Last Updated On: 26 May 2022",style: Theme.of(context).textTheme.headline2,)
          ],
        ),
        Container(
          padding: EdgeInsets.all(Constants.kPadding),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField("Title","Title",Color(0xffededed),Color(0xffededed),Color(0xffededed),controllerTask.title),
                  Row(

                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomTextField("Select Date","Select Date",Color(0xffededed),Color(0xffededed),Color(0xffededed),controllerTask.date,prefixIcon: Icons.calendar_month_rounded,onPressed: openDatePicker,),
                      ),
                      Expanded(
                        child: CustomTextField("Start Time","Select Time",Color(0xffededed),Color(0xffededed),Color(0xffededed),controllerTask.startTime,prefixIcon: Icons.access_time_outlined,onPressed: openStartTimePicker,),
                      ),
                      Expanded(
                        child: CustomTextField("End Time","Select Time",Color(0xffededed),Color(0xffededed),Color(0xffededed),controllerTask.endTime,prefixIcon: Icons.access_time_outlined,onPressed: openEndTimePicker),
                      ),
                      // Expanded(
                      //   child: Center(
                      //     child: CheckboxListTile(
                      //       title: Text("title text"),
                      //       value: false,
                      //       onChanged: (newValue) {
                      //         setState(() {
                      //           // checkedValue = newValue;
                      //         });
                      //       },
                      //       controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text("Select Type",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                              Container(
                                margin: EdgeInsets.only(top: 10,right: 10),
                                padding: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width,
                                height: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey,width: 1.5),
                                    borderRadius: new BorderRadius.all(Radius.circular(5.0))
                                ),

                                child:  DropdownButton<String>(
                                  isExpanded: true,
                                  value: selectedValue,
                                  onChanged: (String? newValue) =>
                                      setState(() => selectedValue = newValue!),
                                  items: items
                                      .map<DropdownMenuItem<String>>(
                                          (String value) => DropdownMenuItem<String>(
                                        value: value,

                                        child: Text(value),
                                      ))
                                      .toList(),

                                  // add extra sugar..
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 30,
                                  underline: SizedBox(),
                                ),
                              ),
                            ],
                          ))

                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(

                        value: false,
                        onChanged: (newValue) {
                          setState(() {
                            // checkedValue = newValue;
                          });
                        },
                        //  <-- leading Checkbox
                      ),
                      SizedBox(width: 5,),
                      Text("All Day Event",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  CustomTextField("Location","Location",Color(0xffededed),Color(0xffededed),Color(0xffededed),controllerTask.lcoation,prefixIcon: Icons.location_pin,),
                  CustomTextField("Description(if any)","Description(if any)",Color(0xffededed),Color(0xffededed),Color(0xffededed),controllerTask.lcoation,prefixIcon: Icons.description,),
                  SizedBox(height: Constants.SizedBoxHeight,),
                  CustomButtons().customElevatedButton("Submit",Colors.green)!,
                  SizedBox(height: Constants.SizedBoxHeight,),
                  Container(
                    color: Color(0xffeaf1f7),
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Attendess Added",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                        GestureDetector(
                          onTap: (){
                            customDialog(
                                context,addAttendessLayout(),"Add Attendess");
                          },
                            child: Icon(Icons.add_box_rounded)),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      controller: controller2,
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ext - Mohan Apte",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                  Row(
                                    children: [

                                      Badges(text: "Remove", colorValue: 0xffbb2124),
                                    ],
                                  )
                                ],
                              ),
                              Divider(color: Color(0xffededed),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ext - Mohan Apte",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                  Row(
                                    children: [

                                      Badges(text: "Remove", colorValue: 0xffbb2124),
                                    ],
                                  )
                                ],
                              ),
                              Divider(color: Color(0xffededed),),
                            ],
                          ),
                        ),

                      ],// use it
                    ),
                  ),


                ],
              )),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  children: [
                    Container(
                    color: Color(0xffeaf1f7),
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Text("Schedule for selected date",style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                  ),
                    Container(
                      height: MediaQuery.of(context).size.height/2.3,
                      child: ListView(
                        controller: controller2,
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("1MAY 15 SUNDAY",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Release on book of Vinayak Damodar Savarkar at Kumaon",style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),),
                                    Row(
                                      children: [

                                        Badges(text: "Cancel", colorValue: 0xffbb2124),
                                      ],
                                    )
                                  ],
                                ),
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
                          ),

                        ],// use it
                      ),
                    ),


                  ],
                ),
              )


            ],
          ),
        ),
      ],
    );
  }


}
