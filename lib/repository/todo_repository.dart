import 'package:flutter/cupertino.dart';

import '../core/api/api.dart';
import '../model/model_todo_list.dart';

class ToDoRepository {
  final Api api = Api();

  Future<List<ModelToDoList>> getTodos(
    BuildContext context, {
    required int page,
    required int limit,
  }) async {
    var response = await api.get(
      context,
      url: '${Api.todos}?_page=$page&_limit=$limit',
    );
    if (response != null) {
      List<ModelToDoList> todos = [];
      for (var item in response) {
        todos.add(ModelToDoList.fromJson(item));
      }
      return todos;
    }
    return [];
  }
}
