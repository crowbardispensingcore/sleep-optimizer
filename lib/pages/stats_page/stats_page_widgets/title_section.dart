import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(
      //   left: 20,
      //   right: 20,
      //   top: 95,
      //   bottom: 30,
      // ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline4,
                children: const [
                  TextSpan(text: 'Your sleeps'),
                  TextSpan(text: '\nin the past 7 days'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
