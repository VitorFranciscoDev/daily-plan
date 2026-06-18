import 'package:daily_plan/presentation/calendar/calendar_state.dart';
import 'package:daily_plan/presentation/calendar/register/create_task_screen.dart';
import 'package:daily_plan/presentation/components/date_picker_button.dart';
import 'package:daily_plan/presentation/components/task_container.dart';
import 'package:daily_plan/presentation/components/week_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CalendarState>().fetchTasksByDate(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Daily Plan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOtherTaskScreen(),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.add,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: Consumer<CalendarState>(
        builder: (context, state, child) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 15),

                Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      "Week tasks",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Spacer(),
                    CalendarDatePickerButton(
                      selectedDate: state.selectedDate,
                      onDateSelected: state.selectDate,
                    ),
                    SizedBox(width: 15),
                  ],
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WeekContainer(
                    dates: state.getWeek(),
                    onDateSelected: state.selectDate,
                    selectedDate: state.selectedDate,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      // Card Todo / Pending
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest
                                          .withValues(alpha: 0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.hourglass_empty,
                                      size: 18,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Todo',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  SizedBox(width: 8),

                                  Flexible(
                                    child: Text(
                                      '${state.todoTasksCount}',
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Task',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Card Done / Complet
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest
                                          .withValues(alpha: 0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.check_circle_outline,
                                      size: 18,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Done',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  SizedBox(width: 8),

                                  Flexible(
                                    child: Text(
                                      '${state.doneTasksCount}',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Task',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.4),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    SizedBox(width: 18),
                    Text(
                      "Tasks:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state.errorMessage.isNotEmpty
                      ? Center(child: Text(state.errorMessage))
                      : state.tasks!.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              Spacer(),
                              Icon(
                                CupertinoIcons.tray,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                                size: 48,
                              ),
                              SizedBox(height: 12),
                              Text(
                                "No tasks for today!",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.tasks!.length,
                          itemBuilder: (context, index) {
                            final task = state.tasks![index];
                            return TaskContainer(
                              theme: Theme.of(context),
                              task: task,
                              onToggleStatus: () async {
                                await state.updateTaskStatus(
                                  task.id!,
                                  !task.isDone,
                                );
                                await state.fetchTasksByDate(state.selectedDate);
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
