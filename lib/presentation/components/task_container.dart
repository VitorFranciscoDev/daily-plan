import 'package:daily_plan/entities/entity_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.theme, required this.task});

  final ThemeData theme;
  final Task task;
  @override
  Widget build(BuildContext context) {
    return  Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color:theme.colorScheme.onSecondary),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.clock,
                              color: theme.colorScheme.primary,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Set Time',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              CupertinoIcons.chevron_right,
                              color: theme.colorScheme.onSurface.withOpacity(0.4),
                              size: 16,
                            ),
                          ],
                        ),
                      );
  }
}