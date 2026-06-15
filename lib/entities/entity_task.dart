import 'package:flutter/foundation.dart';

/// Represents a task created by the user
@immutable
final class Task {
  /// Standard constructor
  const Task({
    this.id,
    required this.title,
    this.description,
    required this.isDone,
    required this.createdAt,
    required this.dueDate,
  });

  /// Unique identifier of the entity
  final int? id;

  /// Title of the task
  final String title;

  /// Description of the task
  final String? description;

  /// Defines if the task is done or not
  final bool isDone;

  /// Date of the creation of the task
  final DateTime createdAt;

  /// Date of the limit for do the task
  final DateTime dueDate;

  /// Transforms a [Task] in a JSON
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_done': isDone ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'due_date': dueDate.toIso8601String(),
    };
  }

  /// Transforms a JSON in a [Task]
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      isDone: map['is_done'] == 1,
      createdAt: DateTime.parse(map['created_at'] as String),
      dueDate: DateTime.parse(map['due_date'] as String),
    );
  }
}
