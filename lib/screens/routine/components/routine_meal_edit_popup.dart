import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';

class EditMealRoutinePopup extends StatelessWidget {
  const EditMealRoutinePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final groupController = TextEditingController();
    final mealController = TextEditingController();
    final alarmController = TextEditingController();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            GenericTextField(
              title: "Grupo",
              placeholder: "",
              width: double.infinity,
              controller: groupController,
              number: false,
              value: "",
            ),
            const SizedBox(height: 20),
            GenericTextField(
              title: "Refeição",
              placeholder: "",
              width: double.infinity,
              controller: mealController,
              number: false,
              value: "",
            ),
            const SizedBox(height: 20),
            GenericTextField(
              title: "Alarme",
              placeholder: "",
              width: double.infinity,
              controller: alarmController,
              number: false,
              value: "",
            ),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonOutlined(
                  text: "EXCLUIR",
                  height: 48,
                  width: double.infinity,
                  onTap: () {},
                  color: Color(
                    danger,
                  ),
                ),
                const SizedBox(width: 20),
                ButtonFilled(
                  text: "SALVAR",
                  height: 48,
                  width: double.infinity,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
