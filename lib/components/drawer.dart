import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class UDrawer extends StatelessWidget {
  const UDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(darkBglight),
      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      child: const Column(
        children: [Text("Menu Lateral")],
      ),
    );
  }
}
