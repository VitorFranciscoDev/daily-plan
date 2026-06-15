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
    this.createdAt,
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
  final DateTime? createdAt;

  /// Date of the limit for do the task
  final DateTime dueDate;

  /// Transforms a [Task] in a JSON
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0,
      'created_at': createdAt,
      'due_date': dueDate,
    };
  }

  /// Transforms a JSON in a [Task]
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      isDone: map['isDone'] == 1,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : null,
      dueDate: DateTime.parse(map['dueDate'] as String),
    );
  }
}
