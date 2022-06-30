import 'package:cm_dashboard/pages/todo/TodoAdd.dart';
import 'package:cm_dashboard/pages/widgets/CustomDialog.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("TO DO LIST",style: Theme.of(context).textTheme.headline2),
              GestureDetector(
                  onTap: (){
                    customDialog(
                        context,TodoAdd(),"Adding item in To Do List");
                  },
                  child: Icon(Icons.add_box_rounded)),
            ],
          ),
          Divider(color: Colors.grey,),
          SizedBox(
            height: 50,
            child: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Active",
                  ),
                  Tab(
                    text: "Complete",
                  ),
                ],
              ),
            ),
          ),

          // create widgets for each tab bar here
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                Container(

                  child: Center(
                    child: Text(
                      'Bike',
                    ),
                  ),
                ),

                // second tab bar viiew widget
                Container(

                  child: Center(
                    child: Text(
                      'Car',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}