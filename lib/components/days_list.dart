import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class DaysList extends StatefulWidget {
  const DaysList({
    super.key,
    required this.days,
  });

  final List<bool> days;

  @override
  State<DaysList> createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
  late List<bool> dias = widget.days;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                dias[0] = !dias[0];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.days[0] ? Color(primarydark) : Colors.white,
                  width: 2,
                ),
                color: widget.days[0]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    color: widget.days[0] ? Color(darkBgdark) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.days[0] = !widget.days[0];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.days[1] ? Color(primarydark) : Colors.white,
                  width: 2,
                ),
                color: widget.days[1]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "T",
                  style: TextStyle(
                    color: widget.days[1] ? Color(darkBgdark) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.days[0] = !widget.days[0];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.days[2] ? Color(primarydark) : Colors.white,
                  width: 2,
                ),
                color: widget.days[2]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "Q",
                  style: TextStyle(
                    color: widget.days[2] ? Color(darkBgdark) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.days[0] = !widget.days[0];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.days[3] ? Color(primarydark) : Colors.white,
                  width: 2,
                ),
                color: widget.days[3]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "Q",
                  style: TextStyle(
                    color: widget.days[3] ? Color(darkBgdark) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.days[0] = !widget.days[0];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.days[4] ? Color(primarydark) : Colors.white,
                  width: 2,
                ),
                color: widget.days[4]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    color: widget.days[4] ? Color(darkBgdark) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.days[0] = !widget.days[0];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.days[5] ? Color(primarydark) : Colors.white,
                  width: 2,
                ),
                color: widget.days[5]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    color: widget.days[5] ? Color(darkBgdark) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.days[0] = !widget.days[0];
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.days[6] ? Color(primarydark) : Colors.white,
                  width: 2,
                ),
                color: widget.days[6]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "D",
                  style: TextStyle(
                    color: widget.days[6] ? Color(darkBgdark) : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
