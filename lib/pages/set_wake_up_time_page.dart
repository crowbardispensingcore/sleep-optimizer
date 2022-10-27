import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetWakeUpTimePage extends StatefulWidget {
  const SetWakeUpTimePage({super.key});

  @override
  State<SetWakeUpTimePage> createState() => _SetWakeUpTimePageState();
}

class _SetWakeUpTimePageState extends State<SetWakeUpTimePage> {
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 30);

  void _onTimeChanged(TimeOfDay newTime) {
    print(_time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 80,
            ),
            child: Text(
              'Your wake up time',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Container(
            child: createInlinePicker(  
              value: _time,
              onChange: _onTimeChanged,
              borderRadius: 0,
              is24HrFormat: true,
              elevation: 0,
              barrierDismissible: false,
              isOnChangeValueMode: true,
              themeData: Theme.of(context).copyWith(
                cardColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              // onCancel: () {
              //   context.go('/');
              // },
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromRadius(40),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromRadius(40),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text('Confirm'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
