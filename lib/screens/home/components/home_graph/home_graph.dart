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
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 10,
                  color: Color(0xFF5A6478),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BarChart(),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xFF5A6478),
                      )
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
