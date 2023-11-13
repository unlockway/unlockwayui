import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';

import 'package:unlockway/data/food.dart';
import 'package:unlockway/screens/meals/components/food_card.dart';

class FoodSelectionPage extends StatefulWidget {
  const FoodSelectionPage({super.key});

  @override
  State<FoodSelectionPage> createState() => _FoodSelectionPageState();
}

class _FoodSelectionPageState extends State<FoodSelectionPage> {
  bool almoco = false;
  bool jantar = false;
  bool cafe = false;
  bool lanche = false;

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            GenericTextField(
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
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  food.length,
                  (i) {
                    return FoodCard(
                      idFood: food[i].idFood,
                      imgURL: food[i].imgURL,
                      name: food[i].name,
                      measurement: food[i].measurement,
                      description: food[i].description,
                      calories: food[i].calories,
                      proteins: food[i].proteins,
                      water: food[i].water,
                      minerals: food[i].minerals,
                      vitamins: food[i].vitamins,
                      fats: food[i].fats,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
