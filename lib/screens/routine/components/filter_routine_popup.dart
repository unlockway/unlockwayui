import 'package:flutter/material.dart';
import 'package:unlockway/components/days_list.dart';

class FilterRoutinePopup extends StatelessWidget {
  const FilterRoutinePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Dias da Semana",
                style: TextStyle(
                  fontFamily: "Inter",
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 14,
                ),
              ),
            ),
            const DaysList(
              days: [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
              ],
              enable: true,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "CANCELAR",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontFamily: "Inter",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "BUSCAR",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
