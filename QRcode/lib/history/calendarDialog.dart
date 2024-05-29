import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({super.key, required this.onSelectedDay});

  final Function(DateTime selectedDay) onSelectedDay;

  @override
  State<CalendarDialog> createState() =>
      _CalendarDialogState(onSelectedDay: (DateTime) {});
}

class _CalendarDialogState extends State<CalendarDialog> {
  final Function(DateTime) onSelectedDay;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _rangeEnd = end;
      _rangeStart = start;
      _focusedDay = focusedDay;
    });
  }

  _CalendarDialogState({required this.onSelectedDay});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2040, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar',
                      style: TextStyle(color: Colors.red)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onSelectedDay(_selectedDay!);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  child:
                      const Text('Ok', style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
