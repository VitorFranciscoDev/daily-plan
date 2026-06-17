import 'package:daily_plan/presentation/task/list/task_screen.dart';
import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier{
  HomeState();
  int currentIndex=0;
  void changeIndex(int index){
    currentIndex=index;
    notifyListeners();
  }
    final List<Widget> screens = [
    const TaskScreen(),
    const Center(child: Text("Calendário")),
    const Center(child: Text("Configurações")),
  ];
}