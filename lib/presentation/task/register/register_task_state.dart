import 'package:flutter/material.dart';
import 'package:daily_plan/entities/entity_task.dart';

import '../../../global.dart';

enum TaskDateSelection { today, tomorrow }

class CreateTaskState with ChangeNotifier {
  CreateTaskState();

  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TaskDateSelection dateSelection = TaskDateSelection.today;
  bool isLoading = false;
  DateTime dueDate = DateTime.now().add(Duration(hours: 1));

  void updateDueDate(DateTime value) {
    dueDate = value;
    notifyListeners();
  }

  Future<bool> saveTask() async {
    isLoading = true;
    notifyListeners();

    try {
      final task = Task(
        title: controllerTitle.text,
        description: controllerDescription.text,
        createdAt: dateSelection == TaskDateSelection.today
            ? DateTime.now()
            : DateTime.now().add(const Duration(days: 1)),
        isDone: false,
        dueDate: dueDate,
      );

      await taskService.createNewTask(task);
      return true;
    } catch (_) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
