import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/relations/routine_meal_on_creation.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/screens/routine/components/routine_card.dart';

class RecommendationRoutines extends StatefulWidget {
  const RecommendationRoutines({
    super.key,
    required this.routines,
    required this.patientMeals,
  });

  final List<RoutineModel> routines;
  final List<MealsModel> patientMeals;

  @override
  State<RecommendationRoutines> createState() => _RecommendationRoutinesState();
}

class _RecommendationRoutinesState extends State<RecommendationRoutines> {
  List<RoutineModel> routineList = [];
  Timer? _debounceTimer;

  // void fetchAllRoutines() async {
  //   var result = await getPatientRoutinesAPI(context, widget.patient);

  //   setState(() {
  //     routineList = result;
  //     _isLoading = false;
  //   });
  // }

  // changeUsedRoutine(String userId, String routineId) {
  //   setState(() {
  //     fetchAllRoutines();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    routineList = widget.routines;
  }

  @override
  void dispose() {
    super.dispose();

    routineList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: routineList.isNotEmpty
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
                            itemCount: routineList.length,
                            itemBuilder: (context, index) {
                              var routineIndex = routineList[index];

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
                                patientMeals: widget.patientMeals,
                                fetchRoutine: () {},
                                routineId: routineIndex.id,
                                name: routineIndex.name,
                                weekRepetitions: routineIndex.weekRepetitions,
                                calories: routineIndex.totalCaloriesInTheDay,
                                meals: filteredMeals,
                                color: Theme.of(context).colorScheme.onSurface,
                                using: routineIndex.inUsage,
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
              ),
      ),
    );
  }

  void _onTextChanged(String value) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      List<RoutineModel> resultName = await getRoutineByNameAPI(context, value);
      setState(() {
        routineList = resultName;
      });
    });
  }
}
