// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/history/patient_history.dart';
import 'package:unlockway/screens/meals/patient_meals.dart';
import 'package:unlockway/screens/routine/patient_routines.dart';

class PatientBottomNavigator extends StatelessWidget {
  const PatientBottomNavigator(this.atual, {super.key, required this.patient});

  final UserModel patient;

  final String atual;

  @override
  Widget build(BuildContext context) {
    Color meal = Theme.of(context).colorScheme.outline;
    Color routine = Theme.of(context).colorScheme.outline;
    Color history = Theme.of(context).colorScheme.outline;

    if (atual == "Meal") {
      meal = Theme.of(context).colorScheme.primary;
    } else if (atual == "Routine") {
      routine = Theme.of(context).colorScheme.primary;
    } else if (atual == "History") {
      history = Theme.of(context).colorScheme.primary;
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
                  PatientMeals(patient: patient),
                );
              },
              icon: Icon(
                PhosphorIcons.bowlFood(PhosphorIconsStyle.regular),
                size: 28,
                color: meal,
              ),
            ),
            IconButton(
              onPressed: () async {
                navigatePage(
                  context,
                  PatientRoutine(patient: patient),
                );
              },
              icon: Icon(
                PhosphorIcons.timer(PhosphorIconsStyle.regular),
                size: 28,
                color: routine,
              ),
            ),
            IconButton(
              onPressed: () {
                navigatePage(
                  context,
                  PatientHistory(
                    patient: patient,
                  ),
                );
              },
              icon: Icon(
                PhosphorIcons.scroll(PhosphorIconsStyle.regular),
                size: 28,
                color: history,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
