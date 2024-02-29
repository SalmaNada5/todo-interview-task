import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/tasks_model.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key, required this.task});
  final Todo? task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your task'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                task?.todo ?? '',
                style: const TextStyle(
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            Text(
              "Task ${task?.completed ?? false ? 'Completed' : 'Not Finished'}",
              style: TextStyle(
                  color: task?.completed ?? false ? Colors.green : Colors.red),
            ),
          ],
        ),
      )),
    );
  }
}
