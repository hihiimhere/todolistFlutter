import 'package:flutter/material.dart';
import 'package:todolist_ver2/screen/addlist.dart';
import 'package:todolist_ver2/screen/complete/CompletedTask.dart';
import 'TaskList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[400],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addlist(
                taskTitle: '',
                taskDetail: '',
              ),
            ),
          );
          //print('clicked add list');
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 80.0, left: 30.0),
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To Do List !',
                    style: TextStyle(
                      color: Colors.brown[400],
                      fontSize: 30.0,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Inclomplete',
                    style: TextStyle(
                      color: Colors.brown[400],
                      fontSize: 20.0,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w600,
                      height: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            //color: Colors.pinkAccent,
            child: TaskList(),
          ),
          Expanded(
            flex: 2,
            //color: Colors.teal,
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Completed',
                    style: TextStyle(
                      color: Colors.brown[400],
                      fontSize: 20.0,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w600,
                      height: 2.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  CompletedTask()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
