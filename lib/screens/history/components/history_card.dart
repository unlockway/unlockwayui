import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/models/relations/history_meal.dart';
import 'package:unlockway/screens/history/components/history_details.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.name,
    required this.weekRepetitions,
    required this.calories,
    required this.date,
    required this.meals,
    required this.color,
  });

  final String name;
  final Map weekRepetitions;
  final double calories;
  final String date;
  final List<HistoryMealOnGet> meals;
  final Color color;

  @override
  Widget build(BuildContext context) {
    List dias;

    dias = weekRepetitions.values.toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              date,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                navigationPageRightAnimation(
                  HistoryDetails(
                    ingestedMeals: meals,
                    days: dias,
                    name: name,
                    color: color,
                    calories: calories,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rotina: $name",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  DaysList(
                    function: null,
                    days: dias,
                    enable: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Calorias Acumuladas",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svgs/Fire.svg"),
                          Text(
                            calories.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE96016),
                            ),
                          ),
                        ],
                      ),
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
