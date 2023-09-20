import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/constants.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.name,
    required this.weekRepetitions,
    required this.calories,
    required this.date,
  });

  final String name;
  final List<bool> weekRepetitions;
  final int calories;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(darkBglight),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rotina: $name",
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Calorias Acumuladas",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          color: Colors.white,
                        ),
                      ),
                      DaysList(
                          days: const [false, true, false, true], func: () {}),
                      Row(children: [
                        SvgPicture.asset("assets/svgs/Fire.svg"),
                        Text(
                          calories.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE96016),
                          ),
                        )
                      ]),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
