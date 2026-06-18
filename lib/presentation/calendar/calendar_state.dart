import 'package:daily_plan/entities/entity_task.dart';
import 'package:daily_plan/global.dart';
import 'package:flutter/material.dart';

class CalendarState extends ChangeNotifier {
  List<Task>? tasks = [];
  bool isLoading = true;
  String errorMessage = '';
  int todoTasksCount = 0;
  int doneTasksCount = 0;
  DateTime selectedDate = DateTime.now();

  List<DateTime> getWeek() {
    DateTime now = DateTime.now();
    DateTime monday = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
    fetchTasksByDate(date);
  }

  Future<void> fetchTasksByDate(DateTime date) async {
    isLoading = true;
    errorMessage = "";

    notifyListeners();
    try {
      tasks = await taskService.listTaskByDate(date);
    } catch (e) {
      errorMessage = 'Erro ao carregar tarefas: $e';
    }

    isLoading = false;
      doneTasksCount = tasks!.where((task) => task.isDone).toList().length;
      todoTasksCount = tasks!.where((task) => task.isDone == false).toList().length;
    notifyListeners();
  }
    Future<void> updateTaskStatus(int taskId, bool isDone) async {
    await taskService.updateTaskStatus(taskId, isDone);
  }
}
