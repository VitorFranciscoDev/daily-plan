import 'package:daily_plan/entities/entity_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.theme, required this.task, required this.onToggleStatus});

  final ThemeData theme;
  final Task task;
  final VoidCallback onToggleStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
     border: Border.all(color: theme.colorScheme.onSecondary.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    if (task.description != null && task.description!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        task.description!,
                        style: TextStyle(
                          color: theme.colorScheme.onSecondary,
                          overflow: TextOverflow.ellipsis,
                        )
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onToggleStatus,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: task.isDone ? theme.colorScheme.primary : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: task.isDone ? theme.colorScheme.primary :  theme.colorScheme.onSecondary,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.checkmark_alt,
                    size: 16,
                    color: task.isDone ?  theme.colorScheme.onPrimary : Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          Divider(
            color: Colors.grey.withOpacity(0.2),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Text(
                "Today",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "${task.dueDate.hour.toString().padLeft(2, '0')}:${task.dueDate.minute.toString().padLeft(2, '0')}", 
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
