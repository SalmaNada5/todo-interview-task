import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/tasks_model.dart';
import 'package:flutter_application_1/view/task_details_page.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({super.key, required this.task});
  final Todo? task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => TaskDetailsPage(task: task))),
      title: Text(task?.todo ?? ''),
      trailing: Text(task?.completed ?? false ? 'Completed!' : 'Not finished'),
    );
  }
}
