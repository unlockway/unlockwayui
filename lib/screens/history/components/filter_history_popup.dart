import 'package:flutter/material.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';

class FilterHistoryPopup extends StatelessWidget {
  const FilterHistoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            const GenericTextField(
                title: "Data de criação",
                placeholder: "dd/mm/yyyy",
                width: double.infinity),
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
