import 'package:daily_plan/entities/entity_task.dart';
import 'package:daily_plan/global.dart';
import 'package:flutter/foundation.dart';

enum TaskFilter { all, todo, done }

class TaskState with ChangeNotifier {
  TaskState();
  TaskFilter currentFilter = TaskFilter.all;
  List<Task>? tasks = [];
  List<Task> done = [];
  List<Task> todo = [];
  bool isLoading = true;
  String errorMessage = '';

  Future<void> fetchTasksByDate() async {
    isLoading = true;
    errorMessage = "";
    notifyListeners();
    try {
      tasks = await taskService.listTaskByDate(DateTime.now());
      done = tasks!.where((task) => task.isDone).toList();
      todo = tasks!.where((task) => task.isDone == false).toList();
    } catch (e) {
      errorMessage = 'Erro ao carregar tarefas: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> updateTaskStatus(int taskId, bool isDone) async {
    await taskService.updateTaskStatus(taskId, isDone);
  }

  void changeFilter(TaskFilter filter) {
    currentFilter = filter;
    notifyListeners();
  }
}
