import 'package:flutter/material.dart';
import 'package:unlockway/screens/cellphone/components/form_progress.dart';
import 'package:unlockway/screens/cellphone/components/generic_form.dart';

class RegisterInitial extends StatelessWidget {
  const RegisterInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: const Column(
        children: [
          FormProgress(steps: 2, now: 1),
          SizedBox(
            height: 20,
          ),
          GenericForm(
              placeholder: "Insira seu nome, ex: Marcela",
              title: "Nome",
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          GenericForm(
              placeholder: "Insira seu sobrenome, ex: Fernandes",
              title: "Sobrenome",
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: GenericForm(
                    placeholder: "Ex: 88", title: "Peso", width: 200),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: GenericForm(
                    placeholder: "Ex: 1,70", title: "Altura", width: 200),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GenericForm(
              placeholder: "Diga-nos qual seu objetivo",
              title: "Meta",
              width: double.infinity),
        ],
      ),
    );
  }
}
