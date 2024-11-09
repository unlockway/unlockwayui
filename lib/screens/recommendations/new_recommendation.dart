import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/routine_suggestion.dart';
import 'package:unlockway/models/user.dart';

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
    List<MealSuggestion> mealSuggestions;
    List<RoutineSuggestion> routineSuggestions;

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
                    borderRadius: BorderRadius.circular(8), // Border radius
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
                    borderRadius: BorderRadius.circular(8), // Border radius
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
          "RECOMENDAÇÕES",
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
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
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
                  onPressed: () {},
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
                  onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
