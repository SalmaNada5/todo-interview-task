import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/tasks_model.dart';

class DioClient {
  Dio dio = Dio();
  Future<Tasks>? getAllTasks({required int limit, required int skip}) async {
    final res = await dio.get('https://dummyjson.com/todos?limit=$limit&skip=$skip');
    return Tasks.fromJson(res.data);
  }
}