import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';
import 'package:sleep_optimizer/models/tracker_model.dart';
import 'package:sleep_optimizer/shared/routes/routes.dart';

import '../providers/tracker_provider.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Expanded(
              child: Center(
                child: AnalogClock(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                      color: const Color.fromARGB(255, 30, 53, 73),
                    ),
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  numberColor: const Color.fromARGB(255, 231, 233, 236),
                  hourHandColor: const Color.fromARGB(255, 231, 233, 236),
                  minuteHandColor: const Color.fromARGB(255, 197, 198, 201),
                  width: 300,
                  showTicks: false,
                  showDigitalClock: false,
                  showSecondHand: true,
                  isLive: true,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 50,
            ),
            child: const TrackButton(),
          )
        ],
      ),
    );
  }
}

class TrackButton extends ConsumerWidget {
  const TrackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Tracker tracker = ref.watch(trackerProvider);

    return OutlinedButton(
      onPressed: () {
        if (tracker.isTracking) {
          router.push('/save-tracking');
        } else {
          ref.read(trackerProvider.notifier).startTracking();
        }
      },
      style: OutlinedButton.styleFrom(
        side: tracker.isTracking
            ? BorderSide(
                width: 3,
                color: Theme.of(context).colorScheme.primary,
              )
            : null,
        foregroundColor:
            tracker.isTracking ? Theme.of(context).colorScheme.primary : null,
      ),
      child: Text(
        tracker.isTracking ? 'End' : 'Start',
      ),
    );
  }
}
