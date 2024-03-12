import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog(
      {super.key, required Null Function(DateTime selectedDay) onSelectedDay});

  @override
  State<CalendarDialog> createState() =>
      _CalendarDialogState(onSelectedDay: (DateTime) {});
}

class _CalendarDialogState extends State<CalendarDialog> {
  final Function(DateTime) onSelectedDay;

  _CalendarDialogState({required this.onSelectedDay});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: DateTime.now(),
            calendarFormat: CalendarFormat.month,
            selectedDayPredicate: (day) {
              return false;
            },
            onDaySelected: (selectedDay, focusedDay) {
              // Call the callback function with the selected day
              onSelectedDay(selectedDay);
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
