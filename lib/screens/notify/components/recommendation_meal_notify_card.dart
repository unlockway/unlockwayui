import 'package:flutter/material.dart';
import 'package:unlockway/models/meal_suggestion.dart';

class RecommendationMealNotifyCard extends StatelessWidget {
  const RecommendationMealNotifyCard({
    super.key,
    required this.mealSuggestion,
  });

  final MealSuggestion mealSuggestion;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: InkWell(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(8),
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
                child: mealSuggestion.photo == null ||
                        mealSuggestion.photo!.isEmpty
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
              Expanded(
                child: SizedBox(
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                          height: 4), // Espaço entre título e descrição
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
