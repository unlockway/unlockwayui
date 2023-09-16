import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/constants.dart';

class NotifyCard extends StatefulWidget {
  const NotifyCard({
    super.key,
    required this.icon,
    required this.description,
    required this.date,
    required this.func,
  });

  final String icon;
  final String description;
  final String date;
  final Function() func;

  @override
  State<NotifyCard> createState() => _NotifyCardState();
}

class _NotifyCardState extends State<NotifyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
        color: Color(darkBglight),
      ),
      child: InkWell(
        onTap: widget.func,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                "assets/svgs/logo_mini.svg",
                width: 28,
                height: 28,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                widget.description,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.date,
                style: const TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontFamily: "Inter",
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}