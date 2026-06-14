import 'package:flutter/material.dart';
import 'package:daily_plan/entities/entity_task.dart'; 

enum TaskDateSelection { today, tomorrow }

class CreateTaskState extends ChangeNotifier {
  CreateTaskState(this._taskService);

  final dynamic _taskService;

  String _title = '';
  String _description = '';
  TaskDateSelection _dateSelection = TaskDateSelection.today;
  bool _isLoading = false;


  String get title => _title;
  String get description => _description;
  TaskDateSelection get dateSelection => _dateSelection;
  bool get isLoading => _isLoading;

  void updateTitle(String value) {
    _title = value;
    notifyListeners();
  }

  void updateDescription(String value) {
    _description = value;
    notifyListeners();
  }

  void setDateSelection(TaskDateSelection selection) {
    _dateSelection = selection;
    notifyListeners();
  }
  Future<bool> saveTask() async {
    if (_title.trim().isEmpty) return false;

    _isLoading = true;
    notifyListeners();

    try {
      final task = Task(
        title: _title,
        description: _description,
        createdAt: _dateSelection == TaskDateSelection.today ? DateTime.now() : DateTime.now().add(const Duration(days: 1)),
        isDone: false,
      );

      await _taskService.createNewTask(task);
      
      _isLoading = false;
      notifyListeners();
      return true; 
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false; 
    }
  }
}