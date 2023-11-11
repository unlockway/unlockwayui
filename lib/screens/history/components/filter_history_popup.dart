import 'package:flutter/material.dart';
import 'package:unlockway/components/text_field.dart';

class FilterHistoryPopup extends StatelessWidget {
  const FilterHistoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = TextEditingController();

    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            GenericTextField(
              title: "Data",
              placeholder: "dd/mm/yyyy",
              width: double.infinity,
              controller: dataController,
              number: false,
              value: "",
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
