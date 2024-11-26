import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/screens/patient/components/patient_bottom_navigator.dart';
import 'package:unlockway/handlers/nutri.handlers.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/models/relations/routine_meal_on_creation.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/screens/recommendations/recommendations.dart';
import 'package:unlockway/screens/routine/components/routine_card.dart';

class PatientRoutine extends StatelessWidget {
  const PatientRoutine({super.key, required this.patientRoutines});

  final List<RoutineModel> patientRoutines;

  @override
  Widget build(BuildContext context) {
    return patientRoutines.isNotEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: constraints.maxHeight),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.6,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        itemCount: patientRoutines.length,
                        itemBuilder: (context, index) {
                          var routineIndex = patientRoutines[index];

                          List<RoutineMealOnCreation> filteredMeals = [];
                          for (var element in routineIndex.meals) {
                            filteredMeals.add(
                              RoutineMealOnCreation(
                                idMeal: element.mealId,
                                notifyAt: element.notifyAt,
                              ),
                            );
                          }

                          return RoutineCard(
                            patientMeals: null,
                            fetchRoutine: () {},
                            routineId: routineIndex.id,
                            name: routineIndex.name,
                            weekRepetitions: routineIndex.weekRepetitions,
                            calories: routineIndex.totalCaloriesInTheDay,
                            meals: filteredMeals,
                            color: Theme.of(context).colorScheme.onSurface,
                            using: routineIndex.inUsage,
                            noEdit: true,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                PhosphorIcons.timer(PhosphorIconsStyle.regular),
                size: 150,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                child: Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Não há rotinas criadas, crie sua primeira rotina para que ela seja listada aqui.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontFamily: "Inter",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
