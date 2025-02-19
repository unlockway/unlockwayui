import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/models/routine_suggestion.dart';

class RecommendationRoutineNotifyCard extends StatelessWidget {
  const RecommendationRoutineNotifyCard({
    super.key,
    required this.routineSuggestion,
  });

  final RoutineSuggestion routineSuggestion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svgs/calendar.svg",
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    routineSuggestion.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8), // Espaço entre os elementos
            DaysList(
              function: null,
              days: routineSuggestion.weekRepetitions,
              enable: false,
            ),
            const SizedBox(height: 8), // Espaço entre os elementos
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/svgs/Fire.svg",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 4), // Espaço entre o ícone e o texto
                Expanded(
                  child: Text(
                    routineSuggestion.totalCaloriesInTheDay.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE96016),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
