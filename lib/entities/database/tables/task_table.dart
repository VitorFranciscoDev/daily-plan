/// The table for tasks
class TaskTable {
  /// The table name
  static const String tableName = 'tasks';

  /// The "id" field
  static const String columnID = 'id';

  /// The "title" field
  static const String columnTitle = 'title';

  /// The "description" field
  static const String columnDescription = 'description';

  /// The "is_done" field
  static const String columnIsDone = 'is_done';

  /// The "created_at" field
  static const String columnCreatedAt = 'created_at';

  /// The "due_date" field
  static const String columnDueDate = 'due_date';

  /// Creates the "tasks" table
  static String createTaskTable() {
    return '''
      CREATE TABLE $tableName (
        $columnID          INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle       TEXT     NOT NULL,
        $columnDescription TEXT,
        $columnIsDone      INTEGER  NOT NULL DEFAULT 0,
        $columnCreatedAt   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        $columnDueDate     DATETIME NOT NULL, 
      );
    ''';
  }
}