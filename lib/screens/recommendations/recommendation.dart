import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/nutri.handlers.dart';
import 'package:unlockway/handlers/recommendation.handlers.dart';
import 'package:unlockway/handlers/suggestions.handlers.dart';
import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/routine_suggestion.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/meals/components/meal_form.dart';
import 'package:unlockway/screens/recommendations/components/recommendation_meal_card.dart';
import 'package:unlockway/screens/recommendations/components/recommendation_routine_card.dart';
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
  RecommendationModel recommendation = RecommendationModel(
    id: "",
    idPatient: "",
    status: "",
    description: "",
    mealSuggestions: [],
    routineSuggestions: [],
    idNutritionist: '',
    patientComment: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    nutritionistPhoto: "",
  );
  List<MealsModel> mealsList = [];
  List<RoutineModel> routineList = [];
  int selectedPage = 0;

  final descriptionController = TextEditingController();
  bool _isLoading = true;

  Future<void> initialOperation() async {
    List<MealsModel> resultMeals = await getPatientMealsAPI(
      context,
      widget.patient.id!,
    );

    List<RoutineModel> resultRoutines = await getPatientRoutinesAPI(
      context,
      widget.patient,
    );

    widget.recommendation != null
        ? recommendation = widget.recommendation!
        : recommendation =
            await createInitialRecommendationAPI(widget.patient.id!, "");

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

  void fetchRecommendation() async {
    setState(() {
      selectedPage = 0;
      _isLoading = true;
    });

    RecommendationModel recommendationAPI =
        await getRecommendationByIdAPI(context, recommendation.id);

    List<MealsModel> resultMeals = await getPatientMealsAPI(
      context,
      widget.patient.id!,
    );

    setState(() {
      mealsList = resultMeals;
      recommendation = recommendationAPI;
      for (var element in recommendationAPI.mealSuggestions) {
        mealsList.add(element);
      }

      _isLoading = false;
    });
  }

  void addRoutineToList(RoutineModel routine) {
    setState(() {
      routineList.add(routine);
      selectedPage = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.recommendation != null
        ? descriptionController.text = widget.recommendation!.description
        : null;
    initialOperation();
  }

  @override
  void dispose() {
    descriptionController.dispose();
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
          onPressed: selectedPage == 0
              ? () async {
                  widget.recommendation != null
                      ? Navigator.of(context).pop()
                      : await deleteInitialRecommendationAPI(
                          context, recommendation.id);
                }
              : () {
                  changePage(0);
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
                height: double.infinity,
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
                                              text: widget.recommendation!
                                                  .formattedStatus,
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
                            const SizedBox(height: 15),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: recommendation.mealSuggestions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: RecommendationMealCard(
                                      enabled: recommendation.status == "SENT"
                                          ? true
                                          : false,
                                      onRecommendation: fetchRecommendation,
                                      recommendation: recommendation,
                                      mealSuggestion:
                                          recommendation.mealSuggestions[index],
                                    ));
                              },
                            ),
                            const SizedBox(height: 15),
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
                            const SizedBox(height: 15),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  recommendation.routineSuggestions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: RecommendationRoutineCard(
                                    enabled: recommendation.status == "SENT"
                                        ? true
                                        : false,
                                    patientMeals: mealsList,
                                    onRecommendation: fetchRecommendation,
                                    recommendation: recommendation,
                                    routineSuggestion: recommendation
                                        .routineSuggestions[index],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 15),
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
                ? RecommendationMeals(
                    recommendation: recommendation,
                    key: const ValueKey(1),
                    meals: mealsList,
                    addMealFunc: fetchRecommendation,
                  )
                : RecommendationRoutines(
                    patientMeals: mealsList,
                    key: const ValueKey(2),
                    routines: routineList,
                  ),
      ),
      bottomNavigationBar: recommendation.status == "APPROVED" ||
              recommendation.status == "DENIED"
          ? null
          : selectedPage == 0
              ? widget.recommendation != null
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () async {
                            await deleteInitialRecommendationAPI(
                              context,
                              recommendation.id,
                            );
                          },
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
                            onPressed: () {
                              editCreateRecommendationAPI(
                                context,
                                recommendation.id,
                                descriptionController.text,
                                recommendation.idPatient,
                                "edit",
                              ).then((value) {
                                fetchRecommendation();
                              });
                            },
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
                              "Criar Recomendação",
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
                Navigator.of(context).push(
                  navigationPageRightAnimation(
                    MealForm(
                      id: '',
                      category: '',
                      description: '',
                      ingredientsSelected: const [],
                      name: '',
                      preparationMethod: '',
                      img: null,
                      onSave: () {},
                      onRecommendation: fetchRecommendation,
                      recommendation: recommendation,
                    ),
                  ),
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
          : selectedPage == 2
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      navigationPageRightAnimation(
                        NewRoutine(
                          patientMeals: mealsList,
                          routineId: null,
                          inUsage: false,
                          meals: const [],
                          name: null,
                          weekRepetitions: null,
                          onRecommendation: fetchRecommendation,
                          recommendation: recommendation,
                        ),
                      ),
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
}
