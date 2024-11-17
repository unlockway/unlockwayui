import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';

class HomeMealCard extends StatelessWidget {
  const HomeMealCard({
    super.key,
    required this.method,
    required this.description,
    required this.category,
    required this.hour,
    required this.imageUrl,
    required this.mealId,
    required this.routineId,
  });

  final String description;
  final String? imageUrl;
  final String? hour;
  final String category;
  final String mealId;
  final String routineId;
  final Function(String routineId, String mealId) method;

  @override
  Widget build(BuildContext context) {
    String actualCategory = "";
    Color cardColor = Theme.of(context).colorScheme.onSurface;

    if (category == 'BREAKFAST') {
      actualCategory = "Café";
      cardColor = const Color(0xFF565536);
    }
    if (category == 'LUNCH') {
      actualCategory = 'Almoço';
      cardColor = const Color(0xFF563836);
    }
    if (category == 'DINNER') {
      actualCategory = 'Jantar';
      cardColor = const Color(0xFF325751);
    }
    if (category == 'SNACK') {
      actualCategory = 'Lanche';
      cardColor = const Color(0xFF565536);
    }
    List actualHour = hour!.split(":00");

    return InkWell(
      onTap: () {
        modalBuilderBottomAnimation(
          context,
          ConsumeMealDialog(
            method: (String routineId, String mealId) {
              method(routineId, mealId);
            },
            mealId: mealId,
            routineId: routineId,
          ),
        );
      },
      child: Container(
        width: 177,
        height: 219,
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 130,
                    )
                  : Container(
                      width: double.infinity,
                      height: 130,
                      color: Theme.of(context).colorScheme.onSurface,
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 13.00),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    actualHour[0],
                    style: TextStyle(
                      fontFamily: "Signika",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      actualCategory,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  description,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Inter",
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsumeMealDialog extends StatelessWidget {
  const ConsumeMealDialog({
    super.key,
    required this.mealId,
    required this.routineId,
    required this.method,
  });

  final String mealId;
  final String routineId;
  final Function(
    String routineId,
    String mealId,
  ) method;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "Você irá consumir essa refeição?",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 18,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: ButtonOutlined(
                  text: "NÃO",
                  height: 48,
                  width: double.infinity,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: Color(danger),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: ButtonFilled(
                    text: "SIM",
                    height: 48,
                    width: double.infinity,
                    onTap: () {
                      method(
                        routineId,
                        mealId,
                      );
                      Navigator.pop(context);
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
