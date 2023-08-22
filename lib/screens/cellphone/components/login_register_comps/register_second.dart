import 'package:flutter/material.dart';
import 'package:unlockway/screens/cellphone/components/form_progress.dart';
import 'package:unlockway/screens/cellphone/components/generic_form.dart';

class RegisterSecond extends StatelessWidget {
  const RegisterSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: const Column(
        children: [
          FormProgress(steps: 2, now: 2),
          SizedBox(
            height: 20,
          ),
          GenericForm(
              placeholder: "Insira seu melhor e-mail",
              title: "E-mail",
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          GenericForm(
              placeholder: "*******", title: "Senha", width: double.infinity),
          SizedBox(
            height: 20,
          ),
          GenericForm(
              placeholder: "*******",
              title: "Confirmar senha",
              width: double.infinity),
        ],
      ),
    );
  }
}
