import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class NotifyCard extends StatefulWidget {
  const NotifyCard(
      {super.key,
      required this.icon,
      required this.description,
      required this.date});

  final String icon;
  final String description;
  final String date;

  @override
  State<NotifyCard> createState() => _NotifyCardState();
}

class _NotifyCardState extends State<NotifyCard> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        height: 74,
        decoration: BoxDecoration(
          color: Color(darkBglight),
        ),
      ),
    );
  }
}
