import 'package:flutter/material.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/constants.dart';

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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Dias da Semana",
                style: TextStyle(
                  fontFamily: "Inter",
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            DaysList(
              days: const [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "CANCELAR",
                    style: TextStyle(
                        color: Colors.white,
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
                      color: Color(primary),
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
