import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/meals.handlers.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/routine_suggestion.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/meals/components/meal_form.dart';
import 'package:unlockway/screens/recommendations/recommendation_meals.dart';
import 'package:unlockway/screens/recommendations/recommendation_routines.dart';
import 'package:unlockway/screens/routine/components/new_routine_page.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({
    super.key,
    required this.patient,
    required this.recommendation,
  });

  final UserModel patient;
  final RecommendationModel? recommendation;

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  List<MealsModel> mealsList = [];
  List<RoutineModel> routineList = [];
  int selectedPage = 0;
  late List<MealSuggestion> mealSuggestions;
  late List<RoutineSuggestion> routineSuggestions;
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

  @override
  void initState() {
    super.initState();
    widget.recommendation != null
        ? descriptionController.text = widget.recommendation!.description
        : null;
    fetchMealsAndRoutines();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedPage == 0
              ? "RECOMENDAÇÃO"
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: selectedPage == 0
            ? Container(
                key: const ValueKey(0),
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            widget.recommendation != null
                                ? Row(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: "STATUS: ",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  widget.recommendation!.status,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            const SizedBox(height: 30),
                            widget.recommendation == null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Refeições",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
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
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Refeições",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 30),
                            widget.recommendation == null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rotinas",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
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
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rotinas",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 30),
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
                            const SizedBox(height: 8),
                            TextFieldSimpleMultline(
                              title: "Descrição",
                              width: double.infinity,
                              controller: descriptionController,
                            ),
                          ],
                        ),
                      ),
              )
            : selectedPage == 1
                ? RecommendationMeals(key: const ValueKey(1), meals: mealsList)
                : RecommendationRoutines(
                    patientMeals: mealsList,
                    key: const ValueKey(2),
                    routines: routineList,
                  ),
      ),
      bottomNavigationBar: selectedPage == 0
          ? widget.recommendation != null
              ? Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.all(16),
                        ),
                        side: WidgetStateProperty.all(
                          BorderSide(
                            color: Color(danger),
                            width: 2,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      child: Text(
                        "Excluir Sugestão",
                        style: TextStyle(
                          color: Color(danger),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(
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
                              width: 2,
                            ),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                              width: 2,
                            ),
                          ),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
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
                )
          : null,
      floatingActionButton: selectedPage == 1
          ? IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                      navigationPageRightAnimation(
                        MealForm(
                          patient: widget.patient,
                          id: '',
                          category: '',
                          description: '',
                          ingredientsSelected: const [],
                          name: '',
                          preparationMethod: '',
                          img: null,
                          onSave: () {},
                        ),
                      ),
                    )
                    .then((value) => addMealSuggestion(value));
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color(primarydark),
                ),
                iconColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.outline),
              ),
              iconSize: 24,
              icon: const Icon(Icons.add),
            )
          : selectedPage == 2
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(
                      navigationPageRightAnimation(
                        NewRoutine(
                          patientMeals: mealsList,
                          routineId: null,
                          inUsage: false,
                          meals: const [],
                          name: null,
                          weekRepetitions: null,
                        ),
                      ),
                    )
                        .then(
                      (value) {
                        addMealSuggestion(value);
                      },
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color(primarydark),
                    ),
                    iconColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.outline),
                  ),
                  iconSize: 24,
                  icon: const Icon(Icons.add),
                )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void addMealSuggestion(MealsModel meal) {
    String idPatient = widget.patient.id!;
    String idNutritionist = userData.id!;

    MealSuggestion suggestion =
        convertToMealSuggestion(meal, idPatient, idNutritionist, "");

    // Adiciona a sugestão à lista de mealSuggestions
    mealSuggestions.add(suggestion);

    // Atualiza o estado da página
    setState(() {
      selectedPage = 0;
    });
  }

  MealSuggestion convertToMealSuggestion(MealsModel meal, String idPatient,
      String idNutritionist, String idRecommendation) {
    return MealSuggestion(
      id: meal.id,
      name: meal.name,
      photo: meal.photo,
      description: meal.description,
      category: meal.category,
      preparationMethod: meal.preparationMethod,
      ingredients: meal.ingredients,
      totalCalories: meal.totalCalories,
      createdAt: meal.createdAt,
      updatedAt: meal.updatedAt,
      idPatient: idPatient,
      idNutritionist: idNutritionist,
      idRecommendation: idRecommendation,
    );
  }
}
