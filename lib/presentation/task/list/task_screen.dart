import 'package:daily_plan/entities/database/database.dart';
import 'package:daily_plan/presentation/task/register/register_task_screen.dart';
import 'package:daily_plan/presentation/task/register/register_task_state.dart';
import 'package:daily_plan/services/impl/task_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

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
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => CreateTaskState(),
                    child: const CreateTaskScreen(),
                  ),
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
    );
  }
}
