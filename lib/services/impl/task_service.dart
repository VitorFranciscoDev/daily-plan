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
  Future<List<Task>?> listTaskByDate(DateTime dateTime) async {
    String date="${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    try {
         final db = await _database.database;
        final List<Map<String,dynamic>> data=await db.query(
          "tasks",
          where: "date(due_date)=?",
          whereArgs: [date],
        );
      return data.map((map) => Task.fromMap(map)).toList();
    } on Exception catch (_) {
       rethrow;
    }
  }
  
  @override
  Future<void> updateTaskStatus(int taskId,bool isDone) async{
   try {
      final db = await _database.database;
      await db.update(
      "tasks",
      {
        'is_done': isDone ? 1 : 0,
      },
      where: "id = ?",
      whereArgs: [taskId],
    );
  } catch (_) {
    rethrow;
  }
  }

  
}
