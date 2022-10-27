import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/routes/routes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 100,
                ),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline4,
                    children: const [
                      TextSpan(text: 'Welcome to'),
                      TextSpan(text: '\nSleep Optimizer'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 150,
            ),
            child: Column(
              children: [
                createInlinePicker(
                  value: TimeOfDay(hour: 7, minute: 30),
                  onChange: (time) {},
                  barrierDismissible: false,
                  displayHeader: false,
                  is24HrFormat: true,
                  isOnChangeValueMode: true,
                  borderRadius: 0,
                  dialogInsetPadding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  elevation: 0,
                  themeData: Theme.of(context).copyWith(
                    cardColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
                Text(
                  'When do you need to wake up?',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 100,
              ),
              child: OutlinedButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text('Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
