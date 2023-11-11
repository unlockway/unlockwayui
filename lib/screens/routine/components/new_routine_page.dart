import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/screens/routine/components/new_routine_meal_popup.dart';
import 'package:unlockway/screens/routine/routine.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({
    super.key,
  });

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
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
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 16.0,
              left: 0.0,
              right: 16.0,
              top: 16.0,
            ),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            navigationPageLeftAnimation(
                              const Routine(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 26.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        label: Text(
                          'VOLTAR',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  "assets/svgs/logo_mini.svg",
                  width: 28,
                  height: 28,
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            GenericTextField(
              title: "Nome",
              placeholder: "Insira um nome para a rotina",
              width: double.infinity,
              controller: nameController,
              number: false,
              value: "",
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
    );
  }
}
