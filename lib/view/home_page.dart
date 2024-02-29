import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/tasks_model.dart';
import 'package:flutter_application_1/view/cubit/tasks_cubit.dart';
import 'package:flutter_application_1/view/todo_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginated_list/paginated_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final TasksCubit tasksCubit = BlocProvider.of(context, listen: false);
    tasksCubit.getAllTasks();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: BlocBuilder<TasksCubit, TasksState>(builder: (context, state) {
        return PaginatedList<Todo>(
                isRecentSearch: false,
                isLastPage: tasksCubit.isLastPage,
                items: tasksCubit.todosList,
                builder: (todo, i) {
                  return ToDoWidget(task: tasksCubit.todosList[i]);
                },
                onLoadMore: (int index) {
                  if (tasksCubit.todosList.length >= 30) {
                    tasksCubit.getAllTasks();
                  }
                  return;
                },
                loadingIndicator: tasksCubit.isLastPage
                    ? const SizedBox.shrink()
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              );
      }),
    );
  }
}
