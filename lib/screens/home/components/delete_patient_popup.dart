import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';

class DeletePatientPopup extends StatelessWidget {
  const DeletePatientPopup({
    super.key,
    required this.deleteFunction,
  });

  final VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    // final emailController = TextEditingController();

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
                "Deseja desvincular o paciente?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.outline,
                ),
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
                    child: ButtonFilledDanger(
                      text: "Desvincular",
                      height: 48.0,
                      width: 200,
                      onTap: deleteFunction,
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
