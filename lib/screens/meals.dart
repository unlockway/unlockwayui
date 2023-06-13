import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/bottom_navigator.dart';

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(13),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Meals"),
            UBottomNavigator("Meal"),
          ],
        ),
      ),
    );
  }
}
