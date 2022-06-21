
import 'package:cm_dashboard/utils/constants.dart';
import 'package:cm_dashboard/controllers/CalendarController.dart';
import 'package:cm_dashboard/eventList.dart';
import 'package:cm_dashboard/pages/BudgetList.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';


class CustomCards extends StatefulWidget {
  final String title;
  final Function? onPop;
  final Widget route;
  final Color cardColor;

  CustomCards({Key? key, this.onPop,this.title = "",required this.route,required this.cardColor}) : super(key: key);

  @override
  _CustomCardsState createState() => _CustomCardsState();

}

class _CustomCardsState extends State<CustomCards> {

  @override
  Widget build(BuildContext context) {
    final _sampleEvents = sampleEvents();
    final controllerCalendar = context.watch<CaledarController>();
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
              new MaterialPageRoute(builder: (context) => widget.route)
          );

        },
        child: Container(

            margin: EdgeInsets.only(right: Constants.cardMargin),
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            decoration: BoxDecoration(
                color: widget.cardColor,
                borderRadius: BorderRadius.all(Radius.circular(Constants.cardBorders))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),
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
    );
  }
}

