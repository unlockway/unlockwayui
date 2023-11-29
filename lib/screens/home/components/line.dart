import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    super.key,
    required this.number,
  });

  final num number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          number.toString(),
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontSize: 8,
            color: Color(0xFF5A6478),
          ),
        ),
        Expanded(
          child: Row(
            children: List.generate(
              500 ~/ 10,
              (index) => Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 2),
                  color: index % 2 == 0
                      ? Colors.transparent
                      : const Color(0xFF5A6478),
                  height: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
