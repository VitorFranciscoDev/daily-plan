import 'package:daily_plan/presentation/task/list/task_state.dart';
import 'package:flutter/material.dart';

class TaskFilterWidget extends StatelessWidget {
  const TaskFilterWidget({
    super.key,
    required this.theme,
    required this.currentFilter, // 💡 Adicionado para saber qual aba pintar
    required this.onToggleFilter,
    required this.countAll, // 💡 Adicionado para exibir as quantidades reais
    required this.countTodo,
    required this.countDone,
  });

  final ThemeData theme;
  final TaskFilter currentFilter;
  final ValueChanged<TaskFilter> onToggleFilter;
  final int countAll;
  final int countTodo;
  final int countDone;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 12),
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onToggleFilter(TaskFilter.all),
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Text(
                  "All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: currentFilter == TaskFilter.all
                        ? FontWeight.bold
                        : FontWeight.w500,
                    color: currentFilter == TaskFilter.all
                        ? theme.colorScheme.primary
                        : Colors.grey.shade500,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: currentFilter == TaskFilter.all
                        ? theme.colorScheme.primary
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    countAll.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: currentFilter == TaskFilter.all
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20,
            width: 1,
            color: Colors.grey.withOpacity(0.3),
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
          GestureDetector(
            onTap: () => onToggleFilter(TaskFilter.todo),
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Text(
                  "To-do",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: currentFilter == TaskFilter.todo
                        ? FontWeight.bold
                        : FontWeight.w500,
                    color: currentFilter == TaskFilter.todo
                        ? theme.colorScheme.primary
                        : Colors.grey.shade500,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: currentFilter == TaskFilter.todo
                        ? theme.colorScheme.primary
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    countTodo.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: currentFilter == TaskFilter.todo
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          GestureDetector(
            onTap: () => onToggleFilter(TaskFilter.done),
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: currentFilter == TaskFilter.done
                        ? FontWeight.bold
                        : FontWeight.w500,
                    color: currentFilter == TaskFilter.done
                        ? theme.colorScheme.primary
                        : Colors.grey.shade500,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: currentFilter == TaskFilter.done
                        ? theme.colorScheme.primary
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    countDone.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: currentFilter == TaskFilter.done
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
