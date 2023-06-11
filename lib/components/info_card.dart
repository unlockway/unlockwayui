import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.text,
    required this.hour,
  });

  final String text;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(
            children: [
              Container(
                color: darkBglight,
                child: Text(text, style: const TextStyle(color: Colors.white)),
              ),
              Container(
                color: primary,
                child: Row(
                  children: [],
                ),
              )
            ],
          ),
        ));
  }
}
