
import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:cm_dashboard/pages/AppointmentScreen.dart';
import 'package:cm_dashboard/pages/Home.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controllers/MenuController.dart';


class SidebarView extends StatefulWidget {
  bool showHomeIcon;

  SidebarView({this.showHomeIcon = true,});


  _SidebarViewState createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {




  @override
  Widget build(BuildContext context) {
    final controllerCalendar = context.watch<MenuController>();
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controllerCalendar.menuList.length,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 15),
                GestureDetector(
                  onTap: (){
                    controllerCalendar.currentPage = i;
                    if(i == 0){
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(builder: (context) => new Home()));
                    }else if(i == 1){
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(builder: (context) => new AppointmentScreen()));
                    }


                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Material(
                      color:
                      controllerCalendar.currentPage == i ? Theme.of(context).primaryColor.withOpacity(.1) : null,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(

                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Icon(Icons.home),
                              SizedBox(width: 20),
                              Expanded(child: Text(
                                controllerCalendar.menuList[i].getName.toString(),
                                style: GoogleFonts.nunito(color: Colors.black,fontWeight: FontWeight.bold,
                                  letterSpacing: .8,
                                  fontSize: 14,),
                              )),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            );
          },
        ),
      ],
    );
  }



}

