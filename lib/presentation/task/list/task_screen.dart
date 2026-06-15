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
      appBar: AppBar(
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
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.tasks!.length,
            itemBuilder: (context, index) {
              final task = state.tasks![index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description ?? 'Sem descrição'),
                trailing: Icon(
                  task.isDone
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: task.isDone ? Colors.green : null,
                ),
              );
            },
          );
        },
      ),
    );
  }
}