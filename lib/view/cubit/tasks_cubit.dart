import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/dio_client.dart';
import 'package:flutter_application_1/model/tasks_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  DioClient dioClient = DioClient();
  Tasks? tasksList;
  List<Todo> todosList = [];
  bool get isLastPage => limit > (tasksList?.total ?? 1);
  int limit = 30;
  int skip = 0;
  //? function to get all the todo tasks.
  void getAllTasks() async {
    emit(TasksInitial());
    try {
      tasksList = await dioClient.getAllTasks(limit: limit, skip: skip);

      if (!isLastPage) {
        todosList.addAll(tasksList!.todos!);
        debugPrint('added: ${tasksList!.todos!.length}');
        limit = limit + 30;
        skip = skip + 30;
      }
      emit(GetTaskState());
    } catch (e) {
      debugPrint('Error in getAllTasks: $e');
    }
  }
}
