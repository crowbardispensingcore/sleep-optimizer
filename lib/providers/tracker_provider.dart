import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleep_optimizer/models/tracker_model.dart';

class TrackerNotifier extends StateNotifier<Tracker> {
  TrackerNotifier() : super(const Tracker(isTracking: false));

  void startTracking() {
    state = state.copyWith(
      isTracking: true,
      start: DateTime.now(),
    );
    print("Start tracking: ${state.start!.toIso8601String()}");
  }

  void stopTracking() {
    state = state.copyWith(
      isTracking: false,
      end: DateTime.now(),
    );
    print("End tracking: ${state.end!.toIso8601String()}");
  }
}

final trackerProvider = StateNotifierProvider<TrackerNotifier, Tracker>((ref) {
  return TrackerNotifier();
});
