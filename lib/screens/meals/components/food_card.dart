import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/meals/components/food_info_popup.dart';

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
  final String minerals;
  final String vitamins;
  final double fats;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              modalBuilderBottomAnimation(
                context,
                FoodInfoPopup(
                  calories: calories,
                  proteins: proteins,
                  water: water,
                  fats: fats,
                  vitamins: vitamins,
                  imgURL: imgURL,
                  description: description,
                  name: name,
                ),
              );
            },
            child: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                child: Image.network(
                  imgURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontSize: 22,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          PhosphorIcons.regular.check,
                          size: 24.0,
                          color: Color(darkBg),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      child: Text(
                        measurement,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            child: Icon(
                              PhosphorIcons.regular.minus,
                              size: 24.0,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor:
                                  Theme.of(context).colorScheme.outline,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(darkBgdark)),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(primarydark)),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                hintText: "0.00",
                                hintStyle: const TextStyle(
                                  color: Color(0xFF616B7C),
                                  fontSize: 14,
                                ),
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.onBackground,
                                focusColor:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Theme.of(context).colorScheme.outline,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            child: Icon(
                              PhosphorIcons.regular.plus,
                              size: 24.0,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
