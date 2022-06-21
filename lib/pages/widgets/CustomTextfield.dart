import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  String LabelTextField;
  String HelperTextField;
  Color ColorBorder;
  Color ColorField;
  Color ColorCursor;
  TextEditingController myController;
  IconData? prefixIcon;
  void Function()? onPressed;
  CustomTextField(this.LabelTextField,this.HelperTextField,this.ColorBorder,this.ColorField,this.ColorCursor,this.myController,
      {this.prefixIcon,this.onPressed});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {



  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(right: 10,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.LabelTextField,style: GoogleFonts.nunito(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            height: 45,
            child: TextField(
              onTap: widget.onPressed,
              cursorColor: widget.ColorCursor,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: widget.myController,
              decoration: InputDecoration(
                suffixIcon: Icon(widget.prefixIcon),
                  enabledBorder: new OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black54),
                      borderRadius: new BorderRadius.all(Radius.circular(5.0))),

                  ),
            ),
          ),
        ],
      ),
    );
  }
}