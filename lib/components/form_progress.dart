import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class FormProgress extends StatelessWidget {
  const FormProgress({super.key, required this.steps, required this.now});

  final int steps;
  final int now;

  stepBuilder(BuildContext context) {
    int teste = now;
    List<Widget> bars = [];
    for (var i = 0; i < steps; i++) {
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
            "Etapa $now de $steps",
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
            crossAxisCount: steps,
            crossAxisSpacing: 5,
          ),
          children: stepBuilder(context),
        )
      ],
    );
  }
}
