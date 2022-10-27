import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sleep_optimizer/models/sleep_record_model.dart';
import 'package:sleep_optimizer/providers/sleep_record_provider.dart';

class SleepStatsChart extends ConsumerWidget {
  const SleepStatsChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LineChart(
      mainData(ref),
    );
  }
}

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

LineChartData mainData(WidgetRef ref) {
  final List<SleepRecord> last7DaysSleepRecords =
      ref.watch(last7DaysSleepRecordsProvider);

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 0.5,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 6,
    minY: 5,
    maxY: 8,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 6.8),
          FlSpot(1, 7.2),
          FlSpot(2, 7.1),
          FlSpot(3, 7.0),
          FlSpot(4, 6.3),
          FlSpot(5, 6.9),
          FlSpot(6, 7.0),
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ),
    ],
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('MON', style: style);
      break;
    case 1:
      text = const Text('TUE', style: style);
      break;
    case 2:
      text = const Text('WES', style: style);
      break;
    case 3:
      text = const Text('THU', style: style);
      break;
    case 4:
      text = const Text('FRI', style: style);
      break;
    case 5:
      text = const Text('SAT', style: style);
      break;
    case 6:
      text = const Text('SUN', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0 H';
      break;
    case 1:
      text = '1 H';
      break;
    case 2:
      text = '2 H';
      break;
    case 3:
      text = '3 H';
      break;
    case 4:
      text = '4 H';
      break;
    case 5:
      text = '5 H';
      break;
    case 6:
      text = '6 H';
      break;
    case 7:
      text = '7 H';
      break;
    case 8:
      text = '8 H';
      break;
    case 9:
      text = '9 H';
      break;
    case 10:
      text = '10 H';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}
