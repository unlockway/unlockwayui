import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/screens/meals/components/new_meal_page.dart';

class NewMealPopup extends StatelessWidget {
  const NewMealPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 95,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset("assets/svgs/ia.svg",
                      theme: SvgTheme(
                        currentColor: Theme.of(context).colorScheme.primary,
                      )),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Usar inteligência artifical",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                navigationPageRightAnimation(
                  const NewMeal(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 95,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset("assets/svgs/manually.svg"),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Criar Manualmente",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
