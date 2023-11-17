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
  const FoodSelectionPage({super.key});

  @override
  State<FoodSelectionPage> createState() => _FoodSelectionPageState();
}

class _FoodSelectionPageState extends State<FoodSelectionPage> {
  final List<SelectedFood> selectedFoods = [];
  UserModel user = userData;
  final searchController = TextEditingController();

  bool checkIfExists(List<FoodModel> objectList, String id) {
    return objectList.any((obj) => obj.idFood == id);
  }

  bool checkIfExistsSelectedFood(List<SelectedFood> objectList, String id) {
    return objectList.any((obj) => obj.id == id);
  }

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
              onTap: () {},
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
                        method: getIngredientsByNameAPI(
                          context,
                          user.token!,
                          searchController.text,
                        ),
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
                        checkIfExists(
                            ingredientsRegistered, currentIngredient.idFood);
                        return FoodCard(
                          food: currentIngredient,
                          selected: checkIfExistsSelectedFood(
                            selectedFoods,
                            currentIngredient.idFood,
                          ),
                          selectIngredient: (food, amount) {
                            selectIngredient(food, amount);
                          },
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
