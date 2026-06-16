import 'package:daily_plan/presentation/task/list/task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentScreenIndex = 0;

  final List<Widget> _screens = [
    const TaskScreen(),
    const Center(child: Text("Calendário")),
    const Center(child: Text("Perfil")),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(index: _currentScreenIndex, children: _screens),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 36.0, right: 36.0, bottom: 24.0),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _currentScreenIndex == 0
                  ? Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.home,
                        color: theme.colorScheme.onPrimary,
                        size: 24,
                      ),
                    )
                  : IconButton(
                      icon: const Icon(CupertinoIcons.home),
                      color: theme.colorScheme.onSecondary,
                      iconSize: 24,
                      onPressed: () => setState(() => _currentScreenIndex = 0),
                    ),
              _currentScreenIndex == 1
                  ? Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.calendar_today,
                        color: theme.colorScheme.onPrimary,
                        size: 24,
                      ),
                    )
                  : IconButton(
                      icon: const Icon(CupertinoIcons.calendar_today),
                      color: theme.colorScheme.onSurfaceVariant.withOpacity(
                        0.4,
                      ),
                      iconSize: 24,
                      onPressed: () => setState(() => _currentScreenIndex = 1),
                    ),
              _currentScreenIndex == 2
                  ? Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.settings_outlined,
                        color: theme.colorScheme.onPrimary,
                        size: 24,
                      ),
                    )
                  : IconButton(
                      icon: const Icon(Icons.settings_outlined),
                      color: theme.colorScheme.onSurfaceVariant.withOpacity(
                        0.4,
                      ),
                      iconSize: 24,
                      onPressed: () => setState(() => _currentScreenIndex = 2),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
