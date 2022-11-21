import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_ver2/model/set_task_provider.dart';
import 'CompletedTile.dart';

class CompletedTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comtask = Provider.of<SetTaskProvider>(context, listen: false).taskCompleted;
    return Consumer<SetTaskProvider>(
      builder: (context, SetTaskProvider, child) {
        SizedBox(
          height: 15.0,
        );
        if (comtask.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (Text(
                'No task completed.',
                style: TextStyle(
                  color: Colors.brown[300],
                  fontSize: 20.0,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.normal,
                ),
              )),
            ],
          );
        } else {
          return ListView.builder(
            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            itemCount: SetTaskProvider.taskCompleted.length,
            itemBuilder: (context, index) {
              final task = SetTaskProvider.taskCompleted[index];
              return CompletedTile(
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
      },
    );
  }
}
