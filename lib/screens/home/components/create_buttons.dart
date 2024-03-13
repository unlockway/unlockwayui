import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/meals.handlers.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/screens/meals/components/meal_form.dart';
import 'package:unlockway/screens/routine/components/new_routine_page.dart';

class CreateButtons extends StatefulWidget {
  const CreateButtons({super.key});

  @override
  State<CreateButtons> createState() => _CreateButtonsState();
}

class _CreateButtonsState extends State<CreateButtons> {
  @override
  Widget build(BuildContext context) {
    List<MealsModel> meals = [];
    bool isLoading = true;

    Future<void> fetchMeals() async {
      List<MealsModel> result = await getMealsAPI(context);

      setState(() {});
    }

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
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
                    onSave: () {
                      fetchMeals();
                    },
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFC8E191),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Color(primarylight),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      PhosphorIcons.bowlFood(PhosphorIconsStyle.regular),
                      size: 28,
                      color: const Color(0xFF537706),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CRIAR",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "REFEIÇÃO",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                navigationPageRightAnimation(
                  const NewRoutine(
                    routineId: null,
                    inUsage: null,
                    meals: [],
                    name: null,
                    weekRepetitions: null,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE3CB75),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: const Color(0XFFECD890),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      PhosphorIcons.timer(PhosphorIconsStyle.regular),
                      size: 28,
                      color: const Color(0xFF997800),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CRIAR",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "ROTINA",
                        style: TextStyle(
                          color: Color(darkBgdark),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
