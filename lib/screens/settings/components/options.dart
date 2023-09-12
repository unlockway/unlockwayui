import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class OptionsSettings extends StatelessWidget {
  const OptionsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        InkWell(
          onTap: () {},
          child: Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 95,
              decoration: BoxDecoration(
                color: Color(darkBglight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon(),
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "usar inteligência artifical",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
