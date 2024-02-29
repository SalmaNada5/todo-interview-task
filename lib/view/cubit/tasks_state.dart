part of 'tasks_cubit.dart';

sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class GetTaskState extends TasksState {}
