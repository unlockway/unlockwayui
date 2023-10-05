import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home/components/home_graph/bar.dart';

class HomeGraph extends StatelessWidget {
  const HomeGraph({
    super.key,
    required this.data,
  });

  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 233,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "3000",
                      style: TextStyle(
                        color: Color(0xFF5A6478),
                        fontFamily: "Inter",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "2000",
                      style: TextStyle(
                        color: Color(0xFF5A6478),
                        fontFamily: "Inter",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 300,
                  child: BarChart(
                    colors: [
                      Colors.deepOrange.shade100,
                      Colors.deepOrange.shade200,
                      Colors.deepOrange.shade300,
                      Colors.deepOrange.shade400,
                      Colors.deepOrange.shade100,
                      Colors.deepOrange.shade200,
                      Colors.deepOrange.shade300,
                      Colors.deepOrange.shade400,
                    ],
                    values: const [
                      10,
                      20,
                      30,
                      40,
                      50,
                      60,
                      70,
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
