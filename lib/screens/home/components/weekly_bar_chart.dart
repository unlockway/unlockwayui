import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<double?> weeklyValues;

  const WeeklyBarChart({super.key, required this.weeklyValues});

  @override
  Widget build(BuildContext context) {
    final double maxValue = weeklyValues
        .map((value) => value ?? 0.0)
        .reduce((a, b) => a > b ? a : b);
    final double twentyFivePercent = maxValue * 0.25;
    final double seventyFivePercent = maxValue * 0.75;

    return SizedBox(
      width: double.infinity,
      height: 250,
      child: BarChart(
        BarChartData(
          maxY: maxValue,
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Colors.transparent,
              tooltipPadding: EdgeInsets.zero,
              tooltipMargin: 0,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.toY.round().toString(),
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          barGroups: List.generate(weeklyValues.length, (index) {
            final double value = weeklyValues[index] ?? 0.0;
            Color barColor;

            if (value >= seventyFivePercent) {
              barColor = Color(danger);
            } else if (value <= twentyFivePercent) {
              barColor = Color(blue);
            } else {
              barColor = Color(primary);
            }

            return BarChartGroupData(
              showingTooltipIndicators: [0],
              x: index,
              barRods: [
                BarChartRodData(
                  toY: value,
                  color: barColor,
                  width: 22,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }),
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
                reservedSize: 42,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval:
                    twentyFivePercent, // Garante que seja mostrado a cada 25%
                getTitlesWidget: (value, meta) {
                  if ((value - twentyFivePercent).abs() < 0.1) {
                    return leftTitles(
                        twentyFivePercent.round().toString(), meta);
                  } else if ((value - seventyFivePercent).abs() < 0.1) {
                    return leftTitles(
                        seventyFivePercent.round().toString(), meta);
                  }
                  return Container(); // Esconde outros valores
                },
              ),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              if ((value - twentyFivePercent).abs() < 0.1 ||
                  (value - seventyFivePercent).abs() < 0.1) {
                return const FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                );
              }
              return const FlLine(
                color: Colors.transparent,
              );
            },
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Colors.transparent,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                width: 2,
              ),
              right: BorderSide(
                color: Theme.of(context).colorScheme.onSurface,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(String text, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8, // Distância da barra
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const daysOfWeek = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'];
    final Widget text = Text(
      daysOfWeek[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: text,
    );
  }
}
