import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sleep_optimizer/models/sleep_record_model.dart';
import 'package:sleep_optimizer/providers/sleep_record_provider.dart';

class SleepRecordPage extends ConsumerWidget {
  const SleepRecordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SleepRecord> sleepRecords = ref.watch(sleepRecordProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            context.go('/stats');
          },
          child: const Text('Done'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: sleepRecords.length,
                itemBuilder: (context, index) {
                  return SleepRecordCard(
                    sleepRecord: sleepRecords[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SleepRecordCard extends StatelessWidget {
  const SleepRecordCard({super.key, required this.sleepRecord});

  final SleepRecord sleepRecord;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 27, 41, 54),
      child: SizedBox(
        height: 90,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Text(
                        DateFormat.E().format(sleepRecord.start),
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.MMMd().format(sleepRecord.start),
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${DateFormat.Hm().format(sleepRecord.start)} ~ ${DateFormat.Hm().format(sleepRecord.end)}',
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        '${(sleepRecord.end.difference(sleepRecord.start).inMinutes / 60).toStringAsFixed(1)} h',
                        style: const TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 70,
                child: ElevatedButton(
                  child: const Text('Edit'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return EditSleepRecordDialog();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditSleepRecordDialog extends StatelessWidget {
  const EditSleepRecordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 350,
        width: 250,
        child: const Text(
          'Edit',
        ),
      ),
    );
  }
}
