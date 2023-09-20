import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class DaysList extends StatefulWidget {
  const DaysList({
    super.key,
    required this.days,
    required this.func,
  });

  final List<bool> days;
  final Function() func;

  @override
  State<DaysList> createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: widget.func,
          style: ButtonStyle(
            maximumSize: const MaterialStatePropertyAll(
              Size(40, 40),
            ),
            backgroundColor: widget.days[0]
                ? MaterialStatePropertyAll(
                    Color(primary),
                  )
                : const MaterialStatePropertyAll(
                    Color.fromARGB(255, 43, 55, 68),
                  ),
            side: MaterialStatePropertyAll(BorderSide(
              color: widget.days[0]
                  ? Color(primarydark)
                  : const Color.fromARGB(255, 43, 55, 68),
            )),
          ),
          child: const Text("S"),
        ),
        TextButton(
          onPressed: widget.func,
          style: ButtonStyle(
            maximumSize: const MaterialStatePropertyAll(
              Size(40, 40),
            ),
            backgroundColor: widget.days[1]
                ? MaterialStatePropertyAll(
                    Color(primary),
                  )
                : const MaterialStatePropertyAll(
                    Color.fromARGB(255, 43, 55, 68),
                  ),
            side: MaterialStatePropertyAll(BorderSide(
              color: widget.days[1]
                  ? Color(primarydark)
                  : const Color.fromARGB(255, 43, 55, 68),
            )),
          ),
          child: const Text("T"),
        ),
        TextButton(
          onPressed: widget.func,
          style: ButtonStyle(
            maximumSize: const MaterialStatePropertyAll(
              Size(40, 40),
            ),
            backgroundColor: widget.days[2]
                ? MaterialStatePropertyAll(
                    Color(primary),
                  )
                : const MaterialStatePropertyAll(
                    Color.fromARGB(255, 43, 55, 68),
                  ),
            side: MaterialStatePropertyAll(BorderSide(
              color: widget.days[2]
                  ? Color(primarydark)
                  : const Color.fromARGB(255, 43, 55, 68),
            )),
          ),
          child: const Text("Q"),
        ),
        TextButton(
          onPressed: widget.func,
          style: ButtonStyle(
            maximumSize: const MaterialStatePropertyAll(
              Size(40, 40),
            ),
            backgroundColor: widget.days[3]
                ? MaterialStatePropertyAll(
                    Color(primary),
                  )
                : const MaterialStatePropertyAll(
                    Color.fromARGB(255, 43, 55, 68),
                  ),
            side: MaterialStatePropertyAll(BorderSide(
              color: widget.days[3]
                  ? Color(primarydark)
                  : const Color.fromARGB(255, 43, 55, 68),
            )),
          ),
          child: const Text("Q"),
        ),
      ],
    );
  }
}
