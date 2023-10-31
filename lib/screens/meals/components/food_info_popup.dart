import 'package:flutter/material.dart';

class FoodInfoPopup extends StatelessWidget {
  const FoodInfoPopup({
    super.key,
    required this.calories,
    required this.proteins,
    required this.water,
    required this.fats,
    required this.vitamins,
    required this.imgURL,
    required this.description,
    required this.name,
  });

  final double calories;
  final double proteins;
  final double water;
  final double fats;
  final String vitamins;
  final String imgURL;
  final String description;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 106,
                width: 106,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  child: Image.network(
                    imgURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 22,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      maxLines: 3,
                      description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 14,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(children: [
            Text("Calorias: "),
            Text(
              calories.toString(),
            ),
          ]),
        ],
      ),
    );
  }
}
