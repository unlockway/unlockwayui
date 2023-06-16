import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class InfoCard extends StatelessWidget {
  final String text;

  final String hour;
  const InfoCard({
    super.key,
    required this.text,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        color: Color(darkBglight),        
        ),
        child: Column(
          children: [
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      );
  }
}
