import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/constants.dart';

class CreateButtons extends StatelessWidget {
  const CreateButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFC8E191),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Color(primarylight),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      PhosphorIcons.regular.bowlFood,
                      size: 28,
                      color: const Color(0xFF537706),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CRIAR",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "REFEIÇÃO",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE3CB75),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: const Color(0XFFECD890),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      PhosphorIcons.regular.timer,
                      size: 28,
                      color: const Color(0xFF997800),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CRIAR",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "REFEIÇÃO",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
