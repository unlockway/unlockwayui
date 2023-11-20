import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:unlockway/components/app_bar.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/meals.dart';
import 'package:unlockway/data/routine.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/routine/components/routine_meal_popup.dart';
import 'package:unlockway/screens/routine/components/routine_meal_card.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({
    super.key,
  });

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  UserModel user = userData;

  List<bool> daysSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<RoutineMeal> routineMeals = [];
  final nameController = TextEditingController();

  changeDays(int dayID) {
    daysSelected[dayID] = !daysSelected[dayID];
    print(daysSelected);
  }

  saveToRoutineMeals(String idMeal, String notifyAt) {
    setState(() {
      routineMeals.add(
        RoutineMeal(idMeal, notifyAt),
      );
    });
    print(routineMeals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            ButtonFilled(
              text: "CRIAR ROTINA",
              height: 48,
              width: double.infinity,
              onTap: () {
                createRoutineAPI(
                  context,
                  user.id!,
                  user.token!,
                  nameController.text,
                  false,
                  routineMeals,
                  daysSelected,
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: registerAppBar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      GenericTextField(
                        title: "Nome",
                        placeholder: "Insira um nome para a rotina",
                        width: double.infinity,
                        controller: nameController,
                        number: false,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Selecione os dias que a rotina deve ocorrer",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ),
                          DaysList(
                            days: daysSelected,
                            enable: true,
                            function: (int dayID) {
                              changeDays(dayID);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: routineMeals.isNotEmpty
                      ? ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: constraints.maxHeight),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 2.4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            shrinkWrap: true,
                            itemCount: routineMeals.length,
                            itemBuilder: (context, index) {
                              var filteredMeal = meals
                                  .where(
                                    (element) =>
                                        element.idMeal ==
                                        routineMeals[index].idMeal,
                                  )
                                  .toList();

                              return RoutineMealCard(
                                category: filteredMeal[0].category,
                                meal: filteredMeal[0].name,
                                hour: routineMeals[index].notifyAt.toString(),
                                calories: filteredMeal[0].totalCalories,
                                imgURL: filteredMeal[0].img,
                              );
                            },
                          ),
                        )
                      : const Text(""),
                ),
                SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        modalBuilderBottomAnimation(
                          context,
                          RoutineMealPopup(
                            saveMethod: (String idMeal, String notifyAt) {
                              saveToRoutineMeals(idMeal, notifyAt);
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: Text(
                        "Novo",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                        iconColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary,
                        ),
                        iconSize: const MaterialStatePropertyAll(16),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
