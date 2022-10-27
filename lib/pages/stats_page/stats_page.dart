import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sleep_optimizer/pages/stats_page/stats_page_widgets/evaluation_section.dart';
import 'package:sleep_optimizer/pages/stats_page/stats_page_widgets/sleep_stats_chart.dart';
import 'package:sleep_optimizer/pages/stats_page/stats_page_widgets/title_section.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Done'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.push('/records');
            },
            child: const Text('Edit'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 27, 41, 54),
              ),
              child: Column(
                children: const [
                  TitleSection(),
                  SizedBox(
                    width: 350,
                    height: 200,
                    child: SleepStatsChart(),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Expanded(
              child: SuggestionsSection(),
            ),
          ],
        ),
      ),
    );
  }
}

// TabBar(
//             controller: _tabController,
//             tabs: const <Tab>[
//               Tab(
//                 text: 'Insight',
//               ),
//               Tab(
//                 text: 'Edit',
//               ),
//             ],
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 Text('Tab 1'),
//                 Text('Tab 2'),
//               ],
//             ),
//           )
