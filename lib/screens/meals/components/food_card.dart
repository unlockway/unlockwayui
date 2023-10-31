import 'package:flutter/material.dart';
import 'package:unlockway/components/text_field.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.idFood,
    required this.imgURL,
    required this.name,
    required this.measurement,
    required this.description,
    required this.calories,
    required this.proteins,
    required this.water,
    required this.minerals,
    required this.vitamins,
    required this.fats,
  });

  final String idFood;
  final String imgURL;
  final String name;
  final String measurement;
  final String description;
  final double calories;
  final double proteins;
  final double water;
  final double minerals;
  final List<String> vitamins;
  final double fats;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        children: [
          Image.network(
            imgURL,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontFamily: "Inter",
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    measurement,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontFamily: "Inter",
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(),
                      GenericTextField(),
                      InkWell(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
