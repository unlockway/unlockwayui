import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class FormProgress extends StatefulWidget {
  const FormProgress({
    super.key,
    required this.steps,
    required this.now,
  });

  final int steps;
  final int now;

  @override
  State<FormProgress> createState() => _FormProgressState();
}

class _FormProgressState extends State<FormProgress> {
  bool isNutritionist = false;

  stepBuilder(BuildContext context) {
    int teste = widget.now;
    List<Widget> bars = [];
    for (var i = 0; i < widget.steps; i++) {
      if (teste > 0) {
        teste -= 1;
        bars.add(
          Container(
            width: double.infinity,
            height: 10,
            decoration: BoxDecoration(
              color: Color(primary),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      } else {
        bars.add(
          Container(
            width: double.infinity,
            height: 10,
            decoration: BoxDecoration(
              color: Color(darkBglight),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }
    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Etapa ${widget.now} de ${widget.steps}",
            style: const TextStyle(
              color: Color(0xFF616B7C),
            ),
          ),
        ),
        const SizedBox(height: 15),
        GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 20,
            crossAxisCount: widget.steps,
            crossAxisSpacing: 5,
          ),
          children: stepBuilder(context),
        )
      ],
    );
  }
}
