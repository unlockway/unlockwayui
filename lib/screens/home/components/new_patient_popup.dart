import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';

class NewPatientPopup extends StatelessWidget {
  const NewPatientPopup({
    super.key,
    required this.emailController,
    required this.addPatient,
  });

  final TextEditingController emailController;
  final VoidCallback addPatient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 20, left: 20, bottom: 34),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                "Vincular Paciente",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 30),
              GenericTextField(
                title: "E-mail",
                placeholder: "Insira o e-mail do paciente",
                width: double.infinity,
                controller: emailController,
                number: false,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ButtonOutlined(
                      text: "Cancelar",
                      height: 48.0,
                      width: 200,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: ButtonFilled(
                      text: "Adicionar Paciente",
                      height: 48.0,
                      width: 200,
                      onTap: addPatient,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
