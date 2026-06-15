import 'package:daily_plan/presentation/components/task_container.dart';
import 'package:daily_plan/presentation/task/list/task_state.dart';
import 'package:daily_plan/presentation/task/register/register_task_screen.dart';
import 'package:daily_plan/presentation/task/register/register_task_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              child: Text(
                "No tasks for today!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
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
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: state.tasks!.length,
                  itemBuilder: (context, index) {
                    final task = state.tasks![index];
                    return TaskContainer(
                      theme: Theme.of(context),
                      task: task,
                      onToggleStatus: () async {
                        await state.updateTaskStatus(task.id!, !task.isDone);
                        state.fetchTasksByDate();
                      },
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
