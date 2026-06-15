import 'package:daily_plan/presentation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:daily_plan/presentation/task/list/task_screen.dart';
import 'global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initialize();

  runApp(const DailyPlanApp());
}

class DailyPlanApp extends StatelessWidget {
  const DailyPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DailyPlan',
      theme: lightTheme, 
      darkTheme: darkTheme, 
      themeMode: .system,
      home: TaskScreen(),
    );
  }
}
