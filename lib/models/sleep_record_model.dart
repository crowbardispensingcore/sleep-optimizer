// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

enum Feel {
  good,
  neutral,
  bad,
}

class SleepRecordFields {
  static const String columnId = "id";
  static const String columnStart = "start";
  static const String columnEnd = "end";
  static const String columnFeel = "feel";
  static const String tableSleepRecord = "sleep_record";
}

class SleepRecord {
  int? id;
  late DateTime start;
  late DateTime end;
  Feel? feel;

  SleepRecord({
    this.id,
    required this.start,
    required this.end,
    this.feel,
  });

  Map<String, Object?> toMap() {
    final Map<String, Object?> map = <String, Object?>{};

    if (id != null) {
      map[SleepRecordFields.columnId] = id;
    }

    // if (start != null && end != null) {
    map[SleepRecordFields.columnStart] = start.millisecondsSinceEpoch;
    map[SleepRecordFields.columnEnd] = end.millisecondsSinceEpoch;
    // }

    if (feel != null) {
      map[SleepRecordFields.columnFeel] = feel!.name;
    }

    return map;
  }

  SleepRecord.fromMap(Map<String, Object?> map) {
    id = map[SleepRecordFields.columnId]! as int;

    // if (map[SleepRecordFields.columnStart] != null &&
    //     map[SleepRecordFields.columnEnd] != null) {
    start = DateTime.fromMillisecondsSinceEpoch(
      map[SleepRecordFields.columnStart]! as int,
      isUtc: true,
    );
    end = DateTime.fromMillisecondsSinceEpoch(
      map[SleepRecordFields.columnEnd]! as int,
      isUtc: true,
    );
    // }

    if (map[SleepRecordFields.columnFeel] != null) {
      feel = _feelFromString(map[SleepRecordFields.columnFeel]! as String);
    }
  }

  Feel _feelFromString(String feelString) {
    switch (feelString) {
      case 'good':
        return Feel.good;
      case 'neutral':
        return Feel.neutral;
      case 'bad':
        return Feel.bad;
      default:
        return Feel.neutral;
    }
  }
}
