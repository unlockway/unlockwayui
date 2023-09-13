import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/history/history.dart';
import 'package:unlockway/screens/home/home.dart';
import 'package:unlockway/screens/settings/settings.dart';
import 'package:unlockway/screens/meals/meals.dart';
import 'package:unlockway/screens/routine/routine.dart';
import 'package:unlockway/components/utils/navigation.dart';

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
              icon: SvgPicture.asset(
                "assets/icon/Home.svg",
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(home, BlendMode.srcIn),
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const Meals(),
                );
              },
              icon: SvgPicture.asset(
                "assets/icon/Meal.svg",
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(meal, BlendMode.srcIn),
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const Routine(),
                );
              },
              icon: SvgPicture.asset(
                "assets/icon/time.svg",
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(routine, BlendMode.srcIn),
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const History(),
                );
              },
              icon: SvgPicture.asset(
                "assets/icon/History.svg",
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(history, BlendMode.srcIn),
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const Settings(),
                );
              },
              icon: SvgPicture.asset(
                "assets/icon/Settings.svg",
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(settings, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
