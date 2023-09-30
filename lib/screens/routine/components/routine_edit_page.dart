import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/routine/components/new_routine_meal_popup.dart';
import 'package:unlockway/screens/routine/components/routine_meal_card.dart';
import 'package:unlockway/screens/routine/routine.dart';

class EditRoutine extends StatefulWidget {
  const EditRoutine({
    super.key,
  });

  @override
  State<EditRoutine> createState() => _EditRoutineState();
}

class _EditRoutineState extends State<EditRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      appBar: AppBar(
        flexibleSpace: Container(
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
                        color: Color(primarydark),
                      ),
                      label: Text(
                        'VOLTAR',
                        style: TextStyle(
                          color: Color(primarydark),
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
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(darkBgdark),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            const GenericTextField(
              title: "Nome",
              placeholder: "Insira um nome para a rotina",
              width: double.infinity,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Selecione os dias que a rotina deve ocorrer",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      color: Colors.white,
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
                ),
                const RoutineMealCard(
                  category: "Café da Manhã",
                  meal: "Escolher na Hora",
                  hour: "7:00 AM",
                  calories: 500.00,
                ),
                const SizedBox(
                  height: 16,
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
                        color: Color(primary),
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    style: ButtonStyle(
                      iconColor: MaterialStatePropertyAll(
                        Color(primary),
                      ),
                      iconSize: const MaterialStatePropertyAll(16),
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
