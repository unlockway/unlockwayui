import 'package:flutter/material.dart';
import 'package:unlockway/components/app_bar.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/screens/routine/components/new_routine_meal_popup.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({
    super.key,
  });

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  List<bool> daysSelected = [];
  List<RoutineMeal> routineMeals = [];
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            ButtonFilled(
              text: "CRIAR ROTINA",
              height: 48,
              width: double.infinity,
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: registerAppBar(context),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              GenericTextField(
                title: "Nome",
                placeholder: "Insira um nome para a rotina",
                width: double.infinity,
                controller: nameController,
                number: false,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Selecione os dias que a rotina deve ocorrer",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.outline,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        modalBuilderBottomAnimation(
                          context,
                          const NewRoutineMealPopup(),
                        ).then(
                          (value) {
                            setState(() {});
                          },
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: Text(
                        "Novo",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: ButtonStyle(
                        iconColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary,
                        ),
                        iconSize: const MaterialStatePropertyAll(16),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
