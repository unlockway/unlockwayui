import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/data/meals.dart';
import 'package:unlockway/models/meals.dart';

class NewRoutineMealPopup extends StatefulWidget {
  const NewRoutineMealPopup({super.key});

  @override
  State<NewRoutineMealPopup> createState() => _NewRoutineMealPopupState();
}

class _NewRoutineMealPopupState extends State<NewRoutineMealPopup> {
  String? selectedMeal;
  String category = "BREAKFAST";
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    List<MealsModel> mealsOptions =
        meals.where((element) => element.category == category).toList();

    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categoria",
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontSize: 16,
                fontFamily: "Inter",
              ),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              child: DropdownButton<String>(
                dropdownColor: Theme.of(context).colorScheme.onBackground,
                hint: const Text("EX: Almoço"),
                borderRadius: BorderRadius.circular(6),
                isExpanded: true,
                value: category,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 16,
                  fontFamily: "Inter",
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    category = newValue!;
                  });
                },
                underline: Container(
                  color: Colors.transparent,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'BREAKFAST',
                    child: Text('Café da manhã'),
                  ),
                  DropdownMenuItem(
                    value: 'LUNCH',
                    child: Text('Almoço'),
                  ),
                  DropdownMenuItem(
                    value: 'DINNER',
                    child: Text('Jantar'),
                  ),
                  DropdownMenuItem(
                    value: 'SNACK',
                    child: Text('Lanche'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Refeição",
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontSize: 16,
                fontFamily: "Inter",
              ),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              child: DropdownButton<String>(
                dropdownColor: Theme.of(context).colorScheme.onBackground,
                hint: const Text(""),
                value: selectedMeal,
                borderRadius: BorderRadius.circular(6),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 16,
                  fontFamily: "Inter",
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMeal = newValue!;
                  });
                },
                underline: Container(
                  color: Colors.transparent,
                ),
                items: mealsOptions.map((e) {
                  return DropdownMenuItem(
                    value: e.idMeal,
                    child: Text(e.name),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Horário",
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontSize: 16,
                fontFamily: "Inter",
              ),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                );
                if (timeOfDay != null) {
                  setState(() {
                    selectedTime = timeOfDay;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                width: double.infinity,
                height: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}",
                    // Adiciona um zero à esquerda se necessário
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 16,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonOutlined(
                  text: "CANCELAR",
                  height: 48,
                  width: double.infinity,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 20,
                ),
                ButtonFilled(
                  text: "SALVAR",
                  height: 48,
                  width: double.infinity,
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
