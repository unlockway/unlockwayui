import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home.dart';
import 'package:unlockway/screens/config.dart';
import 'package:unlockway/screens/exercises.dart';
import 'package:unlockway/screens/meals.dart';
import 'package:unlockway/screens/routine.dart';

void navigatePage(BuildContext context, page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return page;
      },
    ),
  );
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          color: darkBglight,
          height: 60,
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
                  icon: SvgPicture.asset("assets/icon/Home.svg")),
              IconButton(
                  onPressed: () {
                    navigatePage(
                      context,
                      const Meals(),
                    );
                  },
                  icon: SvgPicture.asset("assets/icon/Meal.svg")),
              IconButton(
                  onPressed: () {
                    navigatePage(
                      context,
                      const Exercise(),
                    );
                  },
                  icon: SvgPicture.asset("assets/icon/exercise.svg")),
              IconButton(
                  onPressed: () {
                    navigatePage(
                      context,
                      const Routine(),
                    );
                  },
                  icon: SvgPicture.asset("assets/icon/time.svg")),
              IconButton(
                  onPressed: () {
                    navigatePage(
                      context,
                      const Settings(),
                    );
                  },
                  icon: SvgPicture.asset("assets/icon/Settings.svg")),
            ],
          ),
        ),
      ),
    );
  }
}

class LayoutMenu extends StatelessWidget {
  const LayoutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 15, left: 3),
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icon/hamburguer.svg",
                ),
                onPressed: () {},
              )),
          RichText(
            text: const TextSpan(
              text: 'Olá,',
              style: TextStyle(fontSize: 16, color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                  text: ' Daniel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
