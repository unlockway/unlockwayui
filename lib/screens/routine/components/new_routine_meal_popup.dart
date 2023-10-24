import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';

class NewRoutineMealPopup extends StatelessWidget {
  const NewRoutineMealPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            const GenericTextField(
              title: "Grupo",
              placeholder: "Selecionar",
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            const GenericTextField(
                title: "Refeição",
                placeholder: "Selecionar",
                width: double.infinity),
            const SizedBox(height: 20),
            const GenericTextField(
                title: "Alarme",
                placeholder: "Selecionar",
                width: double.infinity),
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
                    Navigator.of(context).pop();
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
