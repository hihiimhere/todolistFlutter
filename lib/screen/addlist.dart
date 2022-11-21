import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_ver2/model/set_task_provider.dart';

class Addlist extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  bool textValidate = false, isTextValidate = false;

  String taskTitle;
  String taskDetail;

  Addlist({required this.taskTitle, required this.taskDetail});

  String? get _errText {
    final text = _controller.value.text;
    final text1 = _controller1.value.text;

    if (text.isEmpty && text1.isEmpty) {
      return 'can\'t be empty';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'To Go Back',
          style: TextStyle(
            fontFamily: 'Cabin',
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(
                      color: Colors.brown[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown.shade400),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown.shade400),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'can\'t be empty';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (newData) {
                    taskTitle = newData;
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _controller1,
                decoration: InputDecoration(
                  labelText: "Detail",
                  labelStyle: TextStyle(
                    color: Colors.brown[400],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown.shade400),
                  ),
                  //errorText: 'can\'t be empty',
                ),
                validator: (value) {
                  //print(value);
                  if (value!.isEmpty) {
                    return 'can\'t be empty';
                  } else {
                    return null;
                  }
                },
                onChanged: (newData) {
                  taskDetail = newData;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: ElevatedButton(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.brown[700],
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown[200],
                  ),
                  onPressed: () {
                    if (_controller.text.isEmpty && _controller1.text.isEmpty ||
                        _controller.text.isEmpty ||
                        _controller1.text.isEmpty) {
                      if (formkey.currentState!.validate()) {
                        return;
                      }
                      return;
                    }
                    Provider.of<SetTaskProvider>(context, listen: false)
                        .addTask(taskTitle, taskDetail);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
