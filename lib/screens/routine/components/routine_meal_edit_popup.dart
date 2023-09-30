import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';

class EditMealRoutinePopup extends StatelessWidget {
  const EditMealRoutinePopup({super.key});

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
            const GenericTextField(
              title: "Grupo",
              placeholder: "",
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const GenericTextField(
              title: "Refeição",
              placeholder: "",
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const GenericTextField(
              title: "Alarme",
              placeholder: "",
              width: double.infinity,
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
