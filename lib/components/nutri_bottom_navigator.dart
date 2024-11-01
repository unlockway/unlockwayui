// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/screens/home/nutri_home.dart';
import 'package:unlockway/screens/settings/nutri_settings.dart';

class NutriBottomNavigator extends StatelessWidget {
  const NutriBottomNavigator(this.atual, {super.key});

  final String atual;

  @override
  Widget build(BuildContext context) {
    Color home = Theme.of(context).colorScheme.outline;
    Color settings = Theme.of(context).colorScheme.outline;

    if (atual == "Home") {
      home = Theme.of(context).colorScheme.primary;
    } else if (atual == "Settings") {
      settings = Theme.of(context).colorScheme.primary;
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
          color: Theme.of(context).colorScheme.onSurface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const NutriHome(),
                );
              },
              icon: Icon(
                PhosphorIcons.house(PhosphorIconsStyle.regular),
                size: 28,
                color: home,
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  const NutriSettings(),
                );
              },
              icon: Icon(
                PhosphorIcons.gearSix(PhosphorIconsStyle.regular),
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
