import 'package:daily_plan/entities/entity_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinimalTaskContainer extends StatelessWidget {
  const MinimalTaskContainer({
    super.key,
    required this.theme,
    required this.task,
    required this.onToggleStatus,
  });

  final ThemeData theme;
  final Task task;
  final VoidCallback onToggleStatus;

  @override
  Widget build(BuildContext context) {
    final time =
        '${task.dueDate.hour.toString().padLeft(2, '0')}:${task.dueDate.minute.toString().padLeft(2, '0')}';
    final hasDescription =
        task.description != null && task.description!.trim().isNotEmpty;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(
            color: task.isDone
                ? theme.colorScheme.onSecondary.withOpacity(0.35)
                : theme.colorScheme.primary,
            width: 3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment:
            hasDescription ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onToggleStatus,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: task.isDone
                    ? theme.colorScheme.primary
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: task.isDone
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSecondary.withOpacity(0.7),
                  width: 1.6,
                ),
              ),
              child: Icon(
                CupertinoIcons.checkmark_alt,
                size: 14,
                color: task.isDone
                    ? theme.colorScheme.onPrimary
                    : Colors.transparent,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: task.isDone
                              ? theme.colorScheme.onSecondary
                              : theme.colorScheme.onSurface,
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      time,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (hasDescription) ...[
                  const SizedBox(height: 2),
                  Text(
                    task.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSecondary,
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
