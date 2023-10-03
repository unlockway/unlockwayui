import 'package:flutter/material.dart';

class HomeGraph extends StatelessWidget {
  const HomeGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("CALORIAS POR DIA",
            style: TextStyle(color: Colors.white, fontFamily: "Inter")),
      ],
    );
  }
}
