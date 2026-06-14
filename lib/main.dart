import 'package:flutter/material.dart';
import 'package:daily_plan/entities/database/database.dart'; 
import 'package:daily_plan/presentation/task/task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = DailyPlanDatabase(); 

  runApp(DailyPlanApp(database: database));
}

class DailyPlanApp extends StatelessWidget {
  const DailyPlanApp({super.key, required this.database});

  final DailyPlanDatabase database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DailyPlan',
      home: TaskScreen(database: database), 
    );
  }
}