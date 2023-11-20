import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class DaysList extends StatefulWidget {
  const DaysList({
    super.key,
    required this.days,
    required this.enable,
    required this.function,
  });

  final List<bool> days;
  final bool enable;
  final Function? function;

  @override
  State<DaysList> createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
  late List<bool> dias;

  @override
  void initState() {
    super.initState();
    if (widget.days.isNotEmpty) {
      dias = List.from(widget.days);
    } else {
      dias = [false, false, false, false, false, false, false];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.enable
                ? () {
                    setState(() {
                      dias[0] = !dias[0];
                      if (widget.function != null) {
                        widget.function!(0);
                      }
                    });
                  }
                : () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: dias[0]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                color: dias[0]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    color: dias[0]
                        ? Color(darkBgdark)
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: widget.enable
                ? () {
                    setState(() {
                      dias[1] = !dias[1];
                      if (widget.function != null) {
                        widget.function!(1);
                      }
                    });
                  }
                : () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: dias[1]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                color: dias[1]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "T",
                  style: TextStyle(
                    color: dias[1]
                        ? Color(darkBgdark)
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: widget.enable
                ? () {
                    setState(() {
                      dias[2] = !dias[2];
                      if (widget.function != null) {
                        widget.function!(2);
                      }
                    });
                  }
                : () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: dias[2]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                color: dias[2]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "Q",
                  style: TextStyle(
                    color: dias[2]
                        ? Color(darkBgdark)
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: widget.enable
                ? () {
                    setState(() {
                      dias[3] = !dias[3];
                      if (widget.function != null) {
                        widget.function!(3);
                      }
                    });
                  }
                : () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: dias[3]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                color: dias[3]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "Q",
                  style: TextStyle(
                    color: dias[3]
                        ? Color(darkBgdark)
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: widget.enable
                ? () {
                    setState(() {
                      dias[4] = !dias[4];
                      if (widget.function != null) {
                        widget.function!(4);
                      }
                    });
                  }
                : () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: dias[4]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                color: dias[4]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    color: dias[4]
                        ? Color(darkBgdark)
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: widget.enable
                ? () {
                    setState(() {
                      dias[5] = !dias[5];
                      if (widget.function != null) {
                        widget.function!(5);
                      }
                    });
                  }
                : () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: dias[5]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                color: dias[5]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(
                    color: dias[5]
                        ? Color(darkBgdark)
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: widget.enable
                ? () {
                    setState(() {
                      dias[6] = !dias[6];
                      if (widget.function != null) {
                        widget.function!(6);
                      }
                    });
                  }
                : () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: dias[6]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                color: dias[6]
                    ? Color(primarylight)
                    : const Color.fromARGB(48, 255, 255, 255),
              ),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  "D",
                  style: TextStyle(
                    color: dias[6]
                        ? Color(darkBgdark)
                        : Theme.of(context).colorScheme.outline,
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
