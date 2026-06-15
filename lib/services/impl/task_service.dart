import 'package:daily_plan/entities/database/database.dart';
import 'package:daily_plan/entities/database/tables/task_table.dart';
import 'package:daily_plan/entities/entity_task.dart';

import '../task.dart';

TaskService newTaskService() {
  return _TaskService();
}

class _TaskService implements TaskService {
  final _database = DailyPlanDatabase();

  @override
  Future<void> createNewTask(Task task) async {
    try {
      final db = await _database.database;

      await db.insert(TaskTable.tableName, task.toJSON());
    } on Exception catch (_) {
      rethrow;
    }
  }
  
  @override
  Future<List<Task>?> listTaskByDate(DateTime date) async {
    try {
         final db = await _database.database;
        final List<Map<String,dynamic>> data=await db.query(
          "tasks",
          where: "due_date=?",
          whereArgs: [date],
        );
      return data.map((map) => Task.fromMap(map)).toList();
    } on Exception catch (_) {
       rethrow;
    }
  }

  
}
