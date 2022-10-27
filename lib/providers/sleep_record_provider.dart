import 'dart:math';

import 'package:riverpod/riverpod.dart';
import 'package:sleep_optimizer/models/sleep_record_model.dart';
import 'package:sleep_optimizer/models/suggestion_model.dart';
import 'package:sleep_optimizer/repositories/sleep_record_repository.dart';

final sleepRecordRepositoryProvider =
    Provider<SleepRecordRepository>((ref) => SleepRecordRepository.instance);

class SleepRecordNotifier extends StateNotifier<List<SleepRecord>> {
  SleepRecordNotifier()
      : super(
          [
            for (int i = 1; i < 29; i++)
              SleepRecord(
                start: DateTime.parse(
                  '2022-10-${i < 10 ? '0$i' : i} ${Random().nextInt(2) + 22}:${Random().nextInt(6)}${Random().nextInt(10)}:33',
                ),
                end: DateTime.parse(
                  '2022-10-${i + 1 < 10 ? '0${i + 1}' : i + 1} 0${Random().nextInt(1) + 6}:${Random().nextInt(6)}${Random().nextInt(10)}:34',
                ),
              )
          ].reversed.toList(),
        );

  void addRecord(SleepRecord sleepRecord) {
    state = [sleepRecord, ...state];
  }

  void removeRecord(int id) {
    state = [
      for (final sleepRecord in state)
        if (sleepRecord.id != id) sleepRecord,
    ];
  }

  void clearRecords() {
    state = [];
  }

  void populateWithRandomRecords() {
    state = [
      for (int i = 1; i < 29; i++)
        SleepRecord(
          start: DateTime.parse(
            '2022-10-${i < 10 ? '0$i' : i} ${Random().nextInt(2) + 22}:${Random().nextInt(6)}${Random().nextInt(10)}:33',
          ),
          end: DateTime.parse(
            '2022-10-${i + 1 < 10 ? '0${i + 1}' : i + 1} 0${Random().nextInt(1) + 6}:${Random().nextInt(6)}${Random().nextInt(10)}:34',
          ),
        )
    ];
    state = state.reversed.toList();
  }
}

final sleepRecordProvider =
    StateNotifierProvider<SleepRecordNotifier, List<SleepRecord>>((ref) {
  return SleepRecordNotifier();
});

final last7DaysSleepRecordsProvider = Provider<List<SleepRecord>>((ref) {
  final sleepRecords = ref.watch(sleepRecordProvider);
  final DateTime mostRecent = sleepRecords[1].start;
  final DateTime oneWeekAgo = mostRecent.subtract(
    Duration(
      days: 7,
      hours: mostRecent.hour,
      seconds: mostRecent.second,
      milliseconds: mostRecent.microsecond,
      microseconds: mostRecent.microsecond,
    ),
  );
  return [
    for (final record in sleepRecords)
      if (record.start.isAfter(oneWeekAgo)) record
  ];
});

final sleepStatsChartDataProvider = Provider<Map<String, Object>>((ref) {
  final last7DaysSleepRecords = ref.watch(last7DaysSleepRecordsProvider);
  Map<String, Object> sleepStatsChartData = {};
  sleepStatsChartData['records'] = last7DaysSleepRecords;

  // Find the lower and higher bound for the chart

  return sleepStatsChartData;
});

final suggestionsProvider = Provider<List<Suggestion>>((ref) {
  return [
    Suggestion(
      title: 'Try to Be Consistent',
      content:
          'To avoid sleep procrastination, go to bed at the same time each night and get up at the same time each morning, including on the weekends.',
    ),
    Suggestion(
      title: 'Block Out As Much Light As Possible test test test test',
      content:
          'Get a blackout curtain if your shutters cannot sufficiently block outside light sources. You can also get a sleep eye mask.',
    ),
    Suggestion(
      title:
          'Force yourself to stay away from screens before bed Loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong',
      content:
          'Try to read a book, do some chores, or simply think about the day just passed?',
    ),
  ];
});
