import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home/components/bar.dart';
import 'package:unlockway/screens/home/components/line.dart';

class HomeGraph extends StatelessWidget {
  const HomeGraph({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      alignment: Alignment.bottomCenter,
      height: 200,
      child: Stack(
        children: [
          const Positioned.fill(
            left: 0,
            top: -80,
            child: Line(number: 3000),
          ),
          const Positioned.fill(
            left: 0,
            top: 50,
            child: Line(number: 2000),
          ),
          Row(
            children: [
              const SizedBox(
                width: 22.5,
              ),
              const VerticalDivider(
                color: Color(0xFF5A6478),
                endIndent: 25,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Bar(data: 40, color: Color(primary), day: "S"),
                    Bar(data: 40, color: Color(primary), day: "T"),
                    Bar(data: 30, color: Color(primary), day: "Q"),
                    Bar(data: 40, color: Color(primary), day: "Q"),
                    Bar(data: 100, color: Color(primary), day: "S"),
                    Bar(data: 100, color: Color(primary), day: "S"),
                    Bar(data: 100, color: Color(primary), day: "D"),
                  ],
                ),
              ),
            ],
          ),
          const Positioned.fill(
            left: 30,
            top: 150,
            child: Divider(
              color: Color(0xFF5A6478),
            ),
          ),
        ],
      ),
    );
  }
}
