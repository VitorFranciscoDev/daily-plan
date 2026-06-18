import 'package:flutter/material.dart';

class WeekContainer extends StatefulWidget {
  final List<DateTime> dates;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const WeekContainer({
    Key? key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<WeekContainer> createState() => _HorizontalCalendarWidgetState();
}

class _HorizontalCalendarWidgetState extends State<WeekContainer> {
  final List<String> _weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, 
        borderRadius: BorderRadius.circular(15)
),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.dates.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final date = widget.dates[index];
          final isSelected = _isSameDay(date, widget.selectedDate);
          final weekdayLetter = _weekDays[date.weekday % 7]; 

          return GestureDetector(
            onTap: () => widget.onDateSelected(date),
            child: Container(
              width: 45,
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weekdayLetter,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}