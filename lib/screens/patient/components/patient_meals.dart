
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/screens/meals/components/meal_card.dart';

class PatientMeals extends StatelessWidget {
  const PatientMeals({
    super.key,
    required this.patientMeals,
  });

  final List<MealsModel> patientMeals;

  @override
  Widget build(BuildContext context) {
    return patientMeals.isNotEmpty
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
                        itemCount: patientMeals.length,
                        itemBuilder: (context, index) {
                          MealsModel actualMeal = patientMeals[index];
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
          );
  }
}
