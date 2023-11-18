import 'package:flutter/material.dart';
import 'package:unlockway/components/app_bar.dart';
import 'package:unlockway/components/buttons.dart';

import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/ingredients.dart';
import 'package:unlockway/handlers/ingredients.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/meals/components/food_card.dart';

class FoodSelectionPage extends StatefulWidget {
  const FoodSelectionPage({
    super.key,
    required this.ingredients,
  });

  final List? ingredients;

  @override
  State<FoodSelectionPage> createState() => _FoodSelectionPageState();
}

class _FoodSelectionPageState extends State<FoodSelectionPage> {
  List<SelectedFood> selectedFoods = [];
  UserModel user = userData;
  final searchController = TextEditingController();

  // bool checkIfExists(List<FoodModel> objectList, String id) {
  //   return objectList.any((obj) => obj.idFood == id);
  // }

  // bool checkIfExistsSelectedFood(List<SelectedFood> objectList, String id) {
  //   return objectList.any((obj) => obj.id == id);
  // }

  selectIngredient(FoodModel food, double amount) {
    SelectedFood selectedFood = SelectedFood(
      food.idFood,
      amount,
    );
    if (selectedFoods.contains(selectedFood)) {
      selectedFoods.remove(selectedFood);
      print(selectedFoods);
    } else {
      selectedFoods.add(selectedFood);
      print(selectedFoods);
    }
  }

  sumOrSubValues(double value, FoodModel selectedFood) {
    selectedFoods = selectedFoods.map((e) {
      if (e.id == selectedFood.idFood) {
        e.amount = value;
        return e;
      }
      return e;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
          top: 6,
        ),
        child: Row(
          children: [
            ButtonFilled(
              text: "ESCOLHER",
              height: 48,
              width: double.infinity,
              onTap: () {
                Navigator.pop(
                  context,
                  selectedFoods,
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: registerAppBar(context),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      SearchTextField(
                        method: () async {
                          await getIngredientsByNameAPI(
                            context,
                            user.token!,
                            searchController.text,
                          );
                          setState(() {});
                        },
                        title: "Pesquisar Alimento",
                        placeholder: "EX: Maçã",
                        width: double.infinity,
                        controller: searchController,
                        number: false,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Selecione os ingredientes",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                            fontSize: 19,
                            fontFamily: "Inter",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight - 140,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2.3,
                      ),
                      shrinkWrap: true,
                      itemCount: ingredientsRegistered.length,
                      itemBuilder: (context, index) {
                        var currentIngredient = ingredientsRegistered[index];
                        bool selected = false;
                        var filteredValue;
                        double? initialValue;

                        if (widget.ingredients != null) {
                          if (widget.ingredients!.any(
                              (obj) => obj.id == currentIngredient.idFood)) {
                            filteredValue = widget.ingredients!
                                .where(
                                  (element) =>
                                      element.id == currentIngredient.idFood,
                                )
                                .toList();
                            selected = true;
                            initialValue = filteredValue[0].amount;
                            print(widget.ingredients![0].amount);
                            print(initialValue);
                          } else {
                            selected = false;
                            initialValue = 0;
                          }
                        }

                        return FoodCard(
                          initialValue: initialValue,
                          food: currentIngredient,
                          selected: selected,
                          selectIngredient: (food, amount) {
                            selectIngredient(food, amount);
                          },
                          sumOrSubValues: sumOrSubValues,
                        );
                      },
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
