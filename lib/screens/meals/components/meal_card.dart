import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/screens/meals/components/new_meal_page.dart';

class UCard extends StatelessWidget {
  const UCard({
    super.key,
    required this.description,
    required this.title,
    this.subtitle,
    required this.imageURL,
    required this.idMeal,
    required this.ingredients,
    required this.category,
    required this.preparationMethod,
  });

  final String description;
  final String title;
  final String? subtitle;
  final String? imageURL;
  final String idMeal;
  final String category;
  final String preparationMethod;
  final List<SelectedFood> ingredients;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          navigationPageRightAnimation(
            NewMeal(
              id: idMeal,
              name: title,
              category: category,
              description: description,
              preparationMethod: preparationMethod,
              ingredientsSelected: ingredients,
              img: imageURL,
            ),
          ),
        );
      },
      child: Container(
        width: 177,
        height: 288,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: imageURL == null
                  ? Container(
                      height: 125,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                    )
                  : Image.network(
                      imageURL!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 125,
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 6.00),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Signika",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 19.02,
                    ),
                  ),
                  Text(
                    subtitle ?? "",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 14.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    textAlign: TextAlign.left,
                    description,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
