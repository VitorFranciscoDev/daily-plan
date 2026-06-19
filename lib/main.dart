import 'package:daily_plan/presentation/app_theme.dart';
import 'package:daily_plan/presentation/calendar/calendar_state.dart';
import 'package:daily_plan/presentation/calendar/register/create_task_state.dart';
import 'package:daily_plan/presentation/home/home_screen.dart';
import 'package:daily_plan/presentation/home/home_state.dart';
import 'package:daily_plan/presentation/task/list/task_state.dart';
import 'package:daily_plan/presentation/task/register/register_task_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskState()),
        ChangeNotifierProvider(create: (context) => CreateTaskState()),
        ChangeNotifierProvider(create: (context) => HomeState(),),
        ChangeNotifierProvider(create: (context) => CalendarState(),),
        ChangeNotifierProvider(create: (context) => CreateOtherTasksState(),)
      ],
      child: DailyPlanApp(),
    ),
  );
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
      home: HomeScreen(),
    );
  }
}
