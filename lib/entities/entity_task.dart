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
  });

  /// Unique identifier of the entity
  final int? id;

  /// Title of the task
  final String title;

  /// Description of the task
  final String? description;

  /// Defines if the task is done or not
  final bool isDone;

  /// Transforms a [Task] in a JSON
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone ? 1 : 0
    };
  }
}