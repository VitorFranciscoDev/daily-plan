import 'package:daily_plan/entities/entity_task.dart';
import 'package:daily_plan/global.dart';
import 'package:flutter/foundation.dart';

class TaskState with ChangeNotifier {
TaskState();

List<Task>? tasks = [];
List<Task> done=[];
List<Task> todo=[];
   bool isLoading = true;
  String errorMessage = '';

Future<void> fetchTasksByDate() async {
  isLoading = true;
  errorMessage = "";
  notifyListeners();
    try {
      tasks=await taskService.listTaskByDate(DateTime.now());
    } catch (e) {
      errorMessage = 'Erro ao carregar tarefas: $e';
    }
    isLoading=false;
    notifyListeners();
  }

Future<void> updateTaskStatus(int taskId,bool isDone) async{
await taskService.updateTaskStatus(taskId, isDone);
}
}