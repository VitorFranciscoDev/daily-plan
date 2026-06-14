import 'package:flutter/material.dart';
import 'package:daily_plan/entities/entity_task.dart';

import '../../../global.dart';

enum TaskDateSelection { today, tomorrow }

class CreateTaskState with ChangeNotifier {
  CreateTaskState();

  String title = '';
  String description = '';
  TaskDateSelection dateSelection = TaskDateSelection.today;
  bool isLoading = false;

  void updateTitle(String value) {
    title = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    description = value;
    notifyListeners();
  }

  void setDateSelection(TaskDateSelection selection) {
    dateSelection = selection;
    notifyListeners();
  }

  Future<bool> saveTask() async {
    if (title.trim().isEmpty) {
      return false;
    }

    isLoading = true;
    notifyListeners();

    try {
      final task = Task(
        title: title,
        description: description,
        createdAt: dateSelection == TaskDateSelection.today
            ? DateTime.now()
            : DateTime.now().add(const Duration(days: 1)),
        isDone: false,
      );

      await taskService.createNewTask(task);

      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
