import 'package:flutter/material.dart';
import 'package:unlockway/components/form_progress.dart';
import 'package:unlockway/components/text_field.dart';

class RegisterInitial extends StatelessWidget {
  const RegisterInitial({
    super.key,
    required this.name,
    required this.lastname,
    required this.peso,
    required this.altura,
    required this.meta,
  });

  final String? name;
  final String? lastname;
  final double? peso;
  final double? altura;
  final String meta;

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
          GenericTextField(
            placeholder: "Insira seu nome, ex: Marcela",
            title: "Nome",
            width: double.infinity,
          ),
          SizedBox(
            height: 20,
          ),
          GenericTextField(
            placeholder: "Insira seu sobrenome, ex: Fernandes",
            title: "Sobrenome",
            width: double.infinity,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: GenericTextField(
                  placeholder: "Ex: 88",
                  title: "Peso",
                  width: 200,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Flexible(
                child: GenericTextField(
                  placeholder: "Ex: 1,70",
                  title: "Altura",
                  width: 200,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GenericTextField(
            placeholder: "Diga-nos qual seu objetivo",
            title: "Meta",
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
