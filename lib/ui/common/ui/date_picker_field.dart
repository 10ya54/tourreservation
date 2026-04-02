import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

/// 日付選択フィールド
class DatePickerField extends StatelessWidget {
  final String labelText;
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;
  final bool isRequired;

  const DatePickerField({
    super.key,
    required this.labelText,
    required this.minDate,
    required this.maxDate,
    required this.onDateSelected,
    this.selectedDate,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(labelText, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(width: 8),
            if (isRequired)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Text(
                  '必須',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        GestureDetector(
          onTap: () {
            DatePicker.showDatePicker(
              context,
              showTitleActions: true,
              minTime: minDate,
              maxTime: maxDate,
              onConfirm: (date) {
                onDateSelected(date);
              },
              currentTime: DateTime.now(),
              locale: LocaleType.jp,
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              selectedDate != null
                  ? '${selectedDate!.year}年${selectedDate!.month}月${selectedDate!.day}日'
                  : '未選択',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
