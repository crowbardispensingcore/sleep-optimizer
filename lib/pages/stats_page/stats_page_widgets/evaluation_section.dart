import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleep_optimizer/models/suggestion_model.dart';
import 'package:sleep_optimizer/providers/sleep_record_provider.dart';

class SuggestionsSection extends ConsumerWidget {
  const SuggestionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Suggestion> suggestions = ref.watch(suggestionsProvider);

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 30,
          child: const Text('Things you can do to improve your sleep:'),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 4,
            ),
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return SuggestionCard(suggestion: suggestions[index]);
            },
          ),
        )
      ],
    );
  }
}

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({super.key, required this.suggestion});

  final Suggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 27, 41, 54),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 100,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                color: const Color.fromARGB(255, 35, 52, 70),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(suggestion.title),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                  5,
                ),
                constraints: const BoxConstraints(
                  minHeight: 80,
                  maxHeight: 200,
                ),
                child: Text(
                  suggestion.content,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                          ),
                        ),
                        child: const Text('Remind Me'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
