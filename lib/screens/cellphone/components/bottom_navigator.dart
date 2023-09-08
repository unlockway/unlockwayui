import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/cellphone/pages/home.dart';
import 'package:unlockway/screens/cellphone/pages/config.dart';
import 'package:unlockway/screens/cellphone/pages/meals.dart';
import 'package:unlockway/screens/cellphone/pages/routine.dart';
import 'package:unlockway/utils/navigation.dart';

class UBottomNavigator extends StatelessWidget {
  const UBottomNavigator(this.atual, {super.key});

  final String atual;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.topCenter,
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            width: 300,
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(darkBglight),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.5),
                          blurRadius: 1.5,
                        ),
                      ]),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restaurant,
                            color: Color(primary), size: 100),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Nova Refeição",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(darkBglight),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.5),
                          blurRadius: 1.5,
                        ),
                      ]),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.close),
                        ),
                        Icon(Icons.alarm_add, color: Color(primary), size: 100),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Nova Rotina",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Inter",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color home = Colors.white;
    Color meal = Colors.white;

    Color routine = Colors.white;
    Color settings = Colors.white;

    if (atual == "Home") {
      home = Color(primary);
    } else if (atual == "Meal") {
      meal = Color(primary);
    } else if (atual == "Routine") {
      routine = Color(primary);
    } else if (atual == "Settings") {
      settings = Color(primary);
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
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Color(primarydark),
                      Color(primarylight),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.5),
                      blurRadius: 1.5,
                    ),
                  ]),
              child: InkWell(
                onTap: () => _dialogBuilder(context),
                child: Center(
                  child: Icon(Icons.add, color: Color(darkBgdark)),
                ),
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
