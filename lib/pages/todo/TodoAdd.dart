import 'package:cm_dashboard/controllers/TaskController.dart';
import 'package:cm_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = taskController(context);
    TextEditingController todoDetails = new TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: _validateDetails,
              controller: todoDetails,

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
                hintText: "Enter Details",

                // Added this
                contentPadding: EdgeInsets.all(17), // Added this
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: Text("Submit", style: GoogleFonts.nunito(fontSize: 12,color: Colors.white)),
              onPressed: (){
                var formState = _formKey.currentState;
                if (formState != null && formState.validate()) {
                  controller.addToDo(context,todoDetails.text);
                }
              },
              color: Color(0xff00a65a),
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
              splashColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
  String? _validateDetails(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Reason is required.';
    }

    return null;
  }

}