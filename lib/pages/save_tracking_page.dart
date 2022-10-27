import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SaveTrackingPage extends StatelessWidget {
  const SaveTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          const Center(
            child: SaveTrackedTimePicker(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.go('/');
                    context.push('/stats');
                  },
                  child: const Text('Save'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Resume'),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaveTrackedTimePicker extends StatelessWidget {
  const SaveTrackedTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return TimePicker(
      initTime: PickedTime(h: 23, m: 45),
      endTime: PickedTime(h: 7, m: 12),
      onSelectionChange: (
        start,
        end,
        isDisableRange,
      ) =>
          print(
        'onSelectionChange => init : ${start.h}:${start.m}, end : ${end.h}:${end.m}, isDisableRangeRange: $isDisableRange',
      ),
      onSelectionEnd: (
        start,
        end,
        isDisableRange,
      ) =>
          print(
        'onSelectionEnd => init : ${start.h}:${start.m}, end : ${end.h}:${end.m},, isDisableRangeRange: $isDisableRange',
      ),
      primarySectors: 4,
      width: 320,
      height: 320,
      decoration: TimePickerDecoration(
        sweepDecoration: TimePickerSweepDecoration(
          pickerColor: const Color.fromARGB(255, 35, 52, 70),
          pickerStrokeWidth: 30,
        ),
        initHandlerDecoration: TimePickerHandlerDecoration(),
        endHandlerDecoration: TimePickerHandlerDecoration(),
      ),
    );
  }
}
