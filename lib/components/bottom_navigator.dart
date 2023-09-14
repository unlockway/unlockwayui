import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/history/history.dart';
import 'package:unlockway/screens/home/home.dart';
import 'package:unlockway/screens/meals/meals.dart';
import 'package:unlockway/screens/routine/routine.dart';
import 'package:unlockway/screens/settings/settings.dart';

class UBottomNavigator extends StatelessWidget {
  const UBottomNavigator(this.atual, {super.key});

  final String atual;

  @override
  Widget build(BuildContext context) {
    Color home = Colors.white;
    Color meal = Colors.white;
    Color routine = Colors.white;
    Color settings = Colors.white;
    Color history = Colors.white;

    if (atual == "Home") {
      home = Color(primary);
    } else if (atual == "Meal") {
      meal = Color(primary);
    } else if (atual == "Routine") {
      routine = Color(primary);
    } else if (atual == "Settings") {
      settings = Color(primary);
    } else if (atual == "History") {
      history = Color(primary);
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(darkBglight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const Home(),
                );
              },
              icon: Icon(
                PhosphorIcons.regular.house,
                size: 28,
                color: home,
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const Meals(),
                );
              },
              icon: Icon(
                PhosphorIcons.regular.bowlFood,
                size: 28,
                color: meal,
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const Routine(),
                );
              },
              icon: Icon(
                PhosphorIcons.regular.timer,
                size: 28,
                color: routine,
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const History(),
                );
              },
              icon: Icon(
                PhosphorIcons.regular.scroll,
                size: 28,
                color: history,
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const Settings(),
                );
              },
              icon: Icon(
                PhosphorIcons.regular.gearSix,
                size: 28,
                color: settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
