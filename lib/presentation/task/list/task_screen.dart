import 'package:daily_plan/presentation/components/minimal_task_container.dart';
import 'package:daily_plan/presentation/components/task_container.dart';
import 'package:daily_plan/presentation/components/task_filter.dart';
import 'package:daily_plan/presentation/app_state.dart';
import 'package:daily_plan/presentation/task/list/task_state.dart';
import 'package:daily_plan/presentation/task/register/register_task_screen.dart';
import 'package:daily_plan/services/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskState>().fetchTasksByDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('EEEE, d MMMM').format(DateTime.now());
    final taskContainerLayout = context.watch<AppState>().taskContainerLayout;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  builder: (context) => const CreateTaskScreen(),
                ),
              );

              if (context.mounted) {
                final taskState = Provider.of<TaskState>(
                  context,
                  listen: false,
                );
                taskState.fetchTasksByDate();
              }
            },
            icon: Icon(
              CupertinoIcons.add,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      body: Consumer<TaskState>(
        builder: (context, state, child) {
          // 1. Estado de Carregamento
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != "") {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            );
          }

          if (state.tasks == null || state.tasks!.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Spacer(),
                  Icon(
                    CupertinoIcons.tray,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 48,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "No tasks for today!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            );
          }
          return Column(
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 12),

                  Text(
                    "Today's tasks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    date,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(children: [
                 
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 12),
                  TaskFilterWidget(
                    theme: Theme.of(context),
                    currentFilter: state.currentFilter,
                    countAll: state.tasks!.length,
                    countTodo: state.todo.length,
                    countDone: state.done.length,
                    onToggleFilter: (newFilter) {
                      state.changeFilter(newFilter);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.currentFilter == TaskFilter.all
                      ? state.tasks!.length
                      : state.currentFilter == TaskFilter.todo
                      ? state.todo.length
                      : state.done.length,
                  itemBuilder: (context, index) {
                    final task = state.currentFilter == TaskFilter.all
                        ? state.tasks![index]
                        : state.currentFilter == TaskFilter.todo
                        ? state.todo[index]
                        : state.done[index];

                    final onToggleStatus = () async {
                      await state.updateTaskStatus(task.id!, !task.isDone);
                      state.fetchTasksByDate();
                    };

                    if (taskContainerLayout == TaskContainerLayout.normal) {
                      return TaskContainer(
                        theme: Theme.of(context),
                        task: task,
                        onToggleStatus: onToggleStatus,
                      );
                    }

                    return MinimalTaskContainer(
                      theme: Theme.of(context),
                      task: task,
                      onToggleStatus: onToggleStatus,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
