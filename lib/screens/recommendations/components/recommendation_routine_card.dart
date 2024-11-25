import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/models/relations/routine_meal_on_creation.dart';
import 'package:unlockway/models/routine_suggestion.dart';
import 'package:unlockway/screens/routine/components/new_routine_page.dart';

class RecommendationRoutineCard extends StatelessWidget {
  const RecommendationRoutineCard({
    super.key,
    required this.enabled,
    required this.routineSuggestion,
    required this.onRecommendation,
    required this.recommendation,
    required this.patientMeals,
  });

  final bool enabled;
  final RoutineSuggestion routineSuggestion;
  final VoidCallback onRecommendation;
  final RecommendationModel recommendation;
  final List<MealsModel> patientMeals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: !enabled
            ? () {}
            : () {
                List<RoutineMealOnCreation> filteredMeals = [];
                for (var element in routineSuggestion.meals) {
                  filteredMeals.add(
                    RoutineMealOnCreation(
                      idMeal: element.mealId,
                      notifyAt: element.notifyAt,
                    ),
                  );
                }
                Navigator.push(
                  context,
                  navigationPageRightAnimation(
                    NewRoutine(
                      onRecommendation: onRecommendation,
                      recommendation: recommendation,
                      routineSuggestion: routineSuggestion,
                      patientMeals: patientMeals,
                      routineId: routineSuggestion.originalRoutineId,
                      name: routineSuggestion.name,
                      meals: filteredMeals,
                      inUsage: routineSuggestion.inUsage,
                      weekRepetitions: routineSuggestion.weekRepetitions,
                    ),
                  ),
                );
              },
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
                  )
                ],
              ),
              DaysList(
                function: null,
                days: routineSuggestion.weekRepetitions,
                enable: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset("assets/svgs/Fire.svg"),
                  Text(
                    routineSuggestion.totalCaloriesInTheDay.toString(),
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
          ),
        ),
      ),
    );
  }
}
