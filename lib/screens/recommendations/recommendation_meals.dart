import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/handlers/meals.handlers.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/meals/components/meal_card.dart';

class RecommendationMeals extends StatefulWidget {
  const RecommendationMeals({
    super.key,
    required this.meals,
    required this.addMealFunc,
    required this.recommendation,
  });

  final Function() addMealFunc;
  final List<MealsModel> meals;
  final RecommendationModel? recommendation;
  @override
  State<RecommendationMeals> createState() => _RecommendationMealsState();
}

class _RecommendationMealsState extends State<RecommendationMeals> {
  late UserModel patient;
  TextEditingController searchController = TextEditingController();
  List<MealsModel> meals = [];
  Timer? _debounceTimer;

  // Future<void> fetchMeals() async {
  //   List<MealsModel> resultMeals = await getPatientMealsAPI(
  //     context,
  //     patient.id!,
  //   );

  //   List<RoutineModel> resultRoutines = await getPatientRoutinesAPI(
  //     context,
  //     patient,
  //   );

  //   setState(() {
  //     routineList = result;
  //     _isLoading = false;
  //   });

  //   setState(() {
  //     meals = result;
  //     _isLoading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    meals = widget.meals;
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    _debounceTimer?.cancel();
    meals = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 40,
      ),
      child: meals.isNotEmpty
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
                            crossAxisCount: 2,
                            childAspectRatio: 0.850,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          shrinkWrap: true,
                          itemCount: meals.length,
                          itemBuilder: (context, index) {
                            MealsModel actualMeal = meals[index];
                            List<SelectedFood> selectedingredients =
                                actualMeal.ingredients.map((e) {
                              return SelectedFood(
                                e.id,
                                e.amount,
                              );
                            }).toList();
                            return MealCard(
                              description: actualMeal.description,
                              title: actualMeal.name,
                              imageURL: actualMeal.photo,
                              category: actualMeal.category,
                              idMeal: actualMeal.id,
                              ingredients: selectedingredients,
                              preparationMethod: actualMeal.preparationMethod,
                              onEdit: () {},
                              onRecommendation: widget.addMealFunc,
                              recommendation: widget.recommendation,
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
                  PhosphorIcons.bowlFood(PhosphorIconsStyle.regular),
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
                  child: SizedBox(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Não há refeições criadas, crie sua primeira refeição para que ela seja listada aqui.",
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
    );
  }

  void _onTextChanged(String value) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      List<MealsModel> resultName = await getMealsByNameAPI(context, value);
      setState(() {
        meals = resultName;
      });
    });
  }
}
