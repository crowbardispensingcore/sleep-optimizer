import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_optimizer/shared/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 55,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    elevation: 10,
                  ),
                  onPressed: () {
                    context.push('/set-wake-up-time');
                  },
                  child: const Icon(
                    Icons.settings,
                  ),
                )
              ],
            ),
          ),
          HomeAction(
            time: TimeOfDay.now(),
          ),
        ],
      ),
    );
  }
}

class HomeAction extends StatelessWidget {
  const HomeAction({
    super.key,
    required this.time,
  });

  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    String partOfDay;
    String action;
    String buttonText;
    if (time.hour >= 6 && time.hour < 12) {
      partOfDay = 'morning';
      action = 'Want to take a nap?';
      buttonText = 'Yes';
    } else if (time.hour >= 12 && time.hour < 18) {
      partOfDay = 'afternoon';
      action = 'Want to take a nap?';
      buttonText = 'Yes';
    } else if (time.hour >= 18 && time.hour < 21) {
      partOfDay = 'evening';
      action = 'Ready to sleep?';
      buttonText = "I'm ready";
    } else {
      partOfDay = 'night';
      action = 'Ready to sleep?';
      buttonText = "I'm ready";
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 470,
          ),
          child: Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.headline4,
              children: [
                const TextSpan(
                  text: 'Good ',
                ),
                TextSpan(
                  text: partOfDay,
                ),
                TextSpan(
                  text: "\n$action",
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 70,
          ),
          child: ElevatedButton(
            onPressed: () {
              context.push('/tracking');
            },
            child: Text(buttonText),
          ),
        ),
      ],
    );
  }
}
