import 'package:daily_plan/entities/database/database.dart';
import 'package:daily_plan/presentation/task/create_task_screen.dart';
import 'package:daily_plan/presentation/task/create_task_state.dart';
import 'package:daily_plan/services/impl/task_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.database});
  final DailyPlanDatabase database; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Plan",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
        actions: [  IconButton(onPressed: () {
          Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ChangeNotifierProvider(
      create: (_) => CreateTaskState(newTaskService(database)),
      child: const CreateTaskScreen(),
    ),
  ),
);
        }, icon: Icon(CupertinoIcons.add))],
      ),
    );
  }
}
