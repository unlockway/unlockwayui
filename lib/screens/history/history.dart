import 'package:flutter/material.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/constants.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("History"),
    );
  }
}
