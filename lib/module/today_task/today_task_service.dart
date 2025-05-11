import 'package:flutter/material.dart';
import 'package:pranala_test/model/model_todo_list.dart';

import '../../repository/todo_repository.dart';

class ToDayTaskService with ChangeNotifier {
  final ToDoRepository _todoRepository = ToDoRepository();
  var todayTask = <ModelToDoList>[];
  bool isLoading = false;
  bool isLoadingMore = false;
  bool isError = false;
  bool offline = false;
  int page = 1;

  Future<void> getTodayTasksFirst(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    var resp = await _todoRepository.getTodos(context, page: 1, limit: 10);
    if (resp.isNotEmpty) {
      todayTask = resp;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTodayTasks(
    BuildContext context, {
    required int pageData,
  }) async {
    isLoadingMore = true;
    notifyListeners();
    var resp = await _todoRepository.getTodos(
      context,
      page: pageData,
      limit: 10,
    );
    if (resp.isNotEmpty) {
      todayTask.addAll(resp);
    }
    isLoadingMore = false;
    notifyListeners();
  }
}
