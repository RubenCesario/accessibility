import 'package:accessibility/accessibility.dart';
import 'package:flutter/material.dart';

/// A showcase widget demonstrating DatePicker and
/// TimePicker with accessibility theming.
class DateTimePickerShowcase extends StatefulWidget {
  /// Creates a [DateTimePickerShowcase].
  const DateTimePickerShowcase({super.key});

  @override
  State<DateTimePickerShowcase> createState() => _DateTimePickerShowcaseState();
}

class _DateTimePickerShowcaseState extends State<DateTimePickerShowcase> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Date & Time Pickers', style: context.textTheme.titleMedium),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _selectedDate != null
                    ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                    : 'Pick Date',
              ),
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (date != null) {
                  setState(() {
                    _selectedDate = date;
                  });
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.access_time),
              label: Text(
                _selectedTime != null
                    ? '${_selectedTime!.hour}:'
                        '${_selectedTime!.minute.toString().padLeft(2, '0')}'
                    : 'Pick Time',
              ),
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) {
                  setState(() {
                    _selectedTime = time;
                  });
                }
              },
            ),
          ),
        ],
      ),
    ],
  );
}
