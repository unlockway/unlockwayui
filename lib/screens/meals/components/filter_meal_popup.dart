import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';

class FilterMealPopup extends StatelessWidget {
  const FilterMealPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const GenericTextField(
                title: "Categoria", placeholder: "", width: double.infinity),
            const SizedBox(height: 20),
            const GenericTextField(
                title: "Data de criação",
                placeholder: "dd/mm/yyyy",
                width: double.infinity),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonOutlined(
                    text: "Cancelar",
                    height: 48.0,
                    width: 600.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
                const SizedBox(width: 10),
                ButtonFilled(
                  text: "Filtrar",
                  height: 48.0,
                  width: 600.0,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
