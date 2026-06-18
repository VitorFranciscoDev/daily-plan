import 'package:flutter/material.dart';
import 'package:daily_plan/entities/entity_task.dart';

import '../../../../global.dart';

class CreateOtherTasksState with ChangeNotifier {
  CreateOtherTasksState();

  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  DateTime dateSelection = DateTime.now();
  bool isLoading = false;
  DateTime dueDate = DateTime.now().add(const Duration(hours: 1));

  void updateDueDate(DateTime value) {
    dueDate = value;
    notifyListeners();
  }

  Future<bool> saveTask() async {

    if (isLoading) return false; 

    isLoading = true;
    notifyListeners();

    try {
      final task = Task(
        title: controllerTitle.text.trim(), 
        description: controllerDescription.text.trim(),
        createdAt:DateTime.now(),
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
  @override
  void dispose() {
    controllerTitle.dispose();
    controllerDescription.dispose();
    super.dispose();
  }
}
