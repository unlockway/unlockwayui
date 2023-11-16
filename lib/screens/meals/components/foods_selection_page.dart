import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/ingredients.dart';
import 'package:unlockway/handlers/ingredients.dart';
import 'package:unlockway/screens/meals/components/food_card.dart';

class FoodSelectionPage extends StatefulWidget {
  const FoodSelectionPage({super.key});

  @override
  State<FoodSelectionPage> createState() => _FoodSelectionPageState();
}

class _FoodSelectionPageState extends State<FoodSelectionPage> {
  @override
  Widget build(BuildContext context) {
    var user = userData as Map;
    final searchController = TextEditingController();

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
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
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 0.0,
            right: 16.0,
            top: 16.0,
          ),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 26.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        'VOLTAR',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/logo_mini.svg",
                width: 28,
                height: 28,
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
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
                          user['token'],
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
                      maxHeight: constraints.maxHeight - 130,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 3,
                      ),
                      shrinkWrap: true,
                      itemCount: ingredientsRegistered.length,
                      itemBuilder: (context, index) {
                        var currentIngredient = ingredientsRegistered[index];
                        return FoodCard(
                          idFood: currentIngredient.idFood,
                          imgURL: currentIngredient.imgURL,
                          name: currentIngredient.name,
                          measurement: currentIngredient.measurement,
                          description: currentIngredient.description,
                          calories: currentIngredient.calories,
                          proteins: currentIngredient.proteins,
                          water: currentIngredient.water,
                          minerals: currentIngredient.minerals,
                          vitamins: currentIngredient.vitamins,
                          fats: currentIngredient.fats,
                          selected: index == 1 ? false : true,
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
