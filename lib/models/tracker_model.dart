// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Tracker {
  final bool isTracking;
  final DateTime? start;
  final DateTime? end;

  const Tracker({
    required this.isTracking,
    this.start,
    this.end,
  });

  

  Tracker copyWith({
    bool? isTracking,
    DateTime? start,
    DateTime? end,
  }) {
    return Tracker(
      isTracking: isTracking ?? this.isTracking,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isTracking': isTracking,
      'start': start?.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
    };
  }

  factory Tracker.fromMap(Map<String, dynamic> map) {
    return Tracker(
      isTracking: map['isTracking'] as bool,
      start: map['start'] != null ? DateTime.fromMillisecondsSinceEpoch(map['start'] as int) : null,
      end: map['end'] != null ? DateTime.fromMillisecondsSinceEpoch(map['end'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tracker.fromJson(String source) => Tracker.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tracker(isTracking: $isTracking, start: $start, end: $end)';

  @override
  bool operator ==(covariant Tracker other) {
    if (identical(this, other)) return true;
  
    return 
      other.isTracking == isTracking &&
      other.start == start &&
      other.end == end;
  }

  @override
  int get hashCode => isTracking.hashCode ^ start.hashCode ^ end.hashCode;
}
