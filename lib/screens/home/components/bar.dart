import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar(
      {super.key, required this.data, required this.color, required this.day});

  final double? data;
  final Color color;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.end, // Alinha a Column na parte inferior
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          data == null ? '' : data.toString(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontFamily: "Inter",
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 30,
          height: data ?? 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),
        Text(
          day,
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontFamily: "Inter",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
