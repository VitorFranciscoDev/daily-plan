import 'package:daily_plan/presentation/calendar/calendar_screen.dart';
import 'package:daily_plan/presentation/calendar/calendar_state.dart';
import 'package:daily_plan/presentation/task/list/task_screen.dart';
import 'package:daily_plan/presentation/task/list/task_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeState extends ChangeNotifier{
  HomeState();
  int currentIndex=0;
  void changeIndex(int index,BuildContext context){
    currentIndex=index;
    if(index==0){
      context.read<TaskState>().fetchTasksByDate();
    }
    if(index==1){
      context.read<CalendarState>().fetchTasksByDate(DateTime.now());
    }
    notifyListeners();
  }
    final List<Widget> screens = [
    const TaskScreen(),
    const CalendarScreen(),
    const Center(child: Text("Configurações")),
  ];
}