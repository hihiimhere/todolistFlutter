import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_ver2/screen/TaskTile.dart';
import '../model/set_task_provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SetTaskProvider>(
        builder: (context, SetTaskProvider, child) {
      if(SetTaskProvider.tasks.isEmpty){
        return Container();
      }else{
        return  ListView.builder(
          // scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          padding: EdgeInsets.all(16.0),
          itemCount: SetTaskProvider.tasks.length,
          itemBuilder: (context, index) {
            final task = SetTaskProvider.tasks[index];
            return TaskTile(
              title: task.title,
              detail: task.detail,
              isChecked: task.isDone,
              checkboxCallback: (checkboxCallback) {
                SetTaskProvider.statusTask(task);
              },
            );
          },
          //padding: EdgeInsets.all(16),

        );
      }
    }
    );
  }
}
