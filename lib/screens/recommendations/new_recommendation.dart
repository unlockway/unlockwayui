import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/handlers/meals.handlers.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/routine_suggestion.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/recommendations/recommendation_meals.dart';
import 'package:unlockway/screens/recommendations/recommendation_routines.dart';

class NewRecommendation extends StatefulWidget {
  const NewRecommendation({
    super.key,
    required this.patient,
  });

  final UserModel patient;

  @override
  State<NewRecommendation> createState() => _NewRecommendationState();
}

class _NewRecommendationState extends State<NewRecommendation> {
  @override
  Widget build(BuildContext context) {
    List<MealsModel> mealsList = [];
    List<RoutineModel> routineList = [];
    int selectedPage = 0;
    List<MealSuggestion> mealSuggestions;
    List<RoutineSuggestion> routineSuggestions;
    final descriptionController = TextEditingController();
    bool _isLoading = true;

    Future<void> fetchMealsAndRoutines() async {
      List<MealsModel> resultMeals = await getPatientMealsAPI(
        context,
        widget.patient.id!,
      );

      List<RoutineModel> resultRoutines = await getPatientRoutinesAPI(
        context,
        widget.patient,
      );

      setState(() {
        mealsList = resultMeals;
        routineList = resultRoutines;
        _isLoading = false;
      });
    }

    void changePage(int page) {
      setState(() {
        selectedPage = page;
      });
    }

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.all(16),
                ),
                side: WidgetStateProperty.all(
                  BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: 2, // Increased border width
                  ),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius
                  ),
                ),
              ),
              child: Text(
                "Cancelar",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.all(16),
                ),
                side: WidgetStateProperty.all(
                  BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2, // Increased border width
                  ),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius
                  ),
                ),
              ),
              child: Text(
                "Criar Sugestão",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedPage == 0
              ? "RECOMENDAÇÕES"
              : selectedPage == 1
                  ? "REFEIÇÕES"
                  : "ROTINAS",
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.outline,
          onPressed: () {
            selectedPage == 0 ? Navigator.of(context).pop() : changePage(0);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: selectedPage == 0
          ? Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Refeições",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      TextButton(
                        onPressed: () {
                          changePage(1);
                        },
                        child: const Text(
                          "VER TODAS",
                          style: TextStyle(
                            color: Color(0xFF1CF3B6),
                            fontWeight: FontWeight.w100,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rotinas",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.outline),
                      ),
                      TextButton(
                        onPressed: () {
                          changePage(2);
                        },
                        child: const Text(
                          "VER TODAS",
                          style: TextStyle(
                            color: Color(0xFF1CF3B6),
                            fontWeight: FontWeight.w100,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descrição",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFieldSimpleMultline(
                    title: "Descrição",
                    width: double.infinity,
                    controller: descriptionController,
                  ),
                ],
              ),
            )
          : selectedPage == 1
              ? RecommendationMeals(
                  meals: mealsList,
                )
              : RecommendationRoutines(routines: routineList),
    );
  }
}
