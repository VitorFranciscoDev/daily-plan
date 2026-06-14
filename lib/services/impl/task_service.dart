import 'package:daily_plan/entities/database/database.dart';
import 'package:daily_plan/entities/database/tables/task_table.dart';
import 'package:daily_plan/entities/entity_task.dart';

import '../task.dart';

TaskService newTaskService(DailyPlanDatabase database) {
  return _TaskService(database);
}

class _TaskService implements TaskService {
  const _TaskService(this._database);

  final DailyPlanDatabase _database;

  @override
  Future<void> createNewTask(Task task) async {
    try {
      final db = await _database.database;

      await db.insert(TaskTable.tableName, task.toJSON());
    } on Exception catch (_) {
      rethrow;
    }
  }
}
