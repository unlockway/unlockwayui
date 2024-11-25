import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/screens/meals/components/meal_form.dart';

class RecommendationMealCard extends StatelessWidget {
  const RecommendationMealCard({
    super.key,
    required this.enabled,
    required this.mealSuggestion,
    required this.onRecommendation,
    required this.recommendation,
  });

  final bool enabled;
  final MealSuggestion mealSuggestion;
  final VoidCallback onRecommendation;
  final RecommendationModel recommendation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !enabled
          ? () {}
          : () {
              List<SelectedFood> selectedingredients =
                  mealSuggestion.ingredients.map((e) {
                return SelectedFood(
                  e.id,
                  e.amount,
                );
              }).toList();

              Navigator.of(context).push(
                navigationPageRightAnimation(
                  MealForm(
                    mealSuggestion: mealSuggestion,
                    onRecommendation: onRecommendation,
                    id: mealSuggestion.originalMealId == null
                        ? ""
                        : mealSuggestion.originalMealId!,
                    name: mealSuggestion.name,
                    category: mealSuggestion.category,
                    description: mealSuggestion.description,
                    preparationMethod: mealSuggestion.preparationMethod,
                    ingredientsSelected: selectedingredients,
                    img: mealSuggestion.photo,
                    recommendation: recommendation,
                    onSave: () {},
                  ),
                ),
              );
            },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Imagem com border-radius ou ícone de "sem imagem"
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child:
                  mealSuggestion.photo == null || mealSuggestion.photo!.isEmpty
                      ? Container(
                          width: 100,
                          height: 100,
                          color: Theme.of(context).colorScheme.onSecondary,
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.grey,
                          ),
                        )
                      : Image.network(
                          mealSuggestion.photo!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
            ),
            const SizedBox(width: 10), // Espaço entre a imagem e o texto
            // Column com título e descrição
            SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    mealSuggestion.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 4), // Espaço entre título e descrição
                  Text(
                    mealSuggestion.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
