import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home/components/bar.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const VerticalDivider(
                color: Color(0xFF5A6478),
                endIndent: 25,
              ),
              Bar(data: 40, color: Color(primary), day: "S"),
              Bar(data: 40, color: Color(primary), day: "S"),
              Bar(data: 30, color: Color(primary), day: "S"),
              Bar(data: 40, color: Color(primary), day: "S"),
              Bar(data: 100, color: Color(primary), day: "S"),
              Bar(data: 100, color: Color(primary), day: "S"),
              Bar(data: 100, color: Color(primary), day: "S"),
            ],
          ),
          const Positioned(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
