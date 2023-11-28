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
                    Bar(
                      data: data[0],
                      color: data[0] == null
                          ? Theme.of(context).colorScheme.onBackground
                          : Color(primary),
                      day: "S",
                    ),
                    Bar(
                        data: data[1],
                        color: data[1] == null
                            ? Theme.of(context).colorScheme.onBackground
                            : Color(primary),
                        day: "T"),
                    Bar(
                        data: data[2],
                        color: data[2] == null
                            ? Theme.of(context).colorScheme.onBackground
                            : Color(primary),
                        day: "Q"),
                    Bar(
                        data: data[3],
                        color: data[3] == null
                            ? Theme.of(context).colorScheme.onBackground
                            : Color(primary),
                        day: "Q"),
                    Bar(
                        data: data[4],
                        color: data[4] == null
                            ? Theme.of(context).colorScheme.onBackground
                            : Color(primary),
                        day: "S"),
                    Bar(
                        data: data[5],
                        color: data[5] == null
                            ? Theme.of(context).colorScheme.onBackground
                            : Color(primary),
                        day: "S"),
                    Bar(
                        data: data[6],
                        color: data[6] == null
                            ? Theme.of(context).colorScheme.onBackground
                            : Color(primary),
                        day: "D"),
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
