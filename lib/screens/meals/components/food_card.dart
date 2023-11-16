import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/meals/components/food_info_popup.dart';

class FoodCard extends StatefulWidget {
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
    required this.selected,
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
  final bool selected;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  String? measureText;
  double quantNumber = 0.00;

  bool selected = false;
  double add = 0;

  sumOrSub(String operation) {
    if (operation == "sum") {
      if (widget.measurement == "AMOUNT") {
        add = 1;
        quantNumber = quantNumber + add;
      } else if (widget.measurement == "MILILITERS" ||
          widget.measurement == "GRAMS") {
        add = 100;
        quantNumber = quantNumber + add;
      }
    }
    if (operation == "sub") {
      if (widget.measurement == "AMOUNT") {
        add = -1;
        quantNumber = quantNumber + add;
      } else if (widget.measurement == "MILILITERS" ||
          widget.measurement == "GRAMS") {
        add = -100;
        quantNumber = quantNumber + add;
      }
    }
  }

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.measurement == "AMOUNT") {
      measureText = "Quantidade";
    } else if (widget.measurement == "MILILITERS") {
      measureText = "Mililitros";
    } else if (widget.measurement == "GRAMS") {
      measureText = "Gramas";
    }

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
                  calories: widget.calories,
                  proteins: widget.proteins,
                  water: widget.water,
                  fats: widget.fats,
                  vitamins: widget.vitamins,
                  imgURL: widget.imgURL,
                  description: widget.description,
                  name: widget.name,
                ),
              );
            },
            child: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                child: Image.network(
                  widget.imgURL,
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
                        widget.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontSize: 22,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: selected
                          ? Container(
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
                            )
                          : Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                        measureText!,
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
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^\d+\.?\d{0,2}'),
                                ),
                              ],
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
