import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(darkBglight),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(PhosphorIcons.regular.caretLeft),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 32.0),
        title: Text(
          "Perfil".toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Salvar".toUpperCase(),
              style: TextStyle(
                color: Color(primarylight),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 84.0,
                backgroundImage: AssetImage("assets/imgs/thomas.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const GenericTextField(
                      title: "Nome",
                      placeholder: "Insira seu nome aqui",
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    const GenericTextField(
                      title: "Sobrenome",
                      placeholder: "Insira seu sobrenome aqui",
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    const Row(
                      children: [
                        Expanded(
                          child: GenericTextField(
                            title: "Peso",
                            placeholder: "KG",
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: GenericTextField(
                            title: "Altura",
                            placeholder: "0,00",
                            width: double.infinity,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const GenericTextField(
                      title: "Meta",
                      placeholder: "Deve ser um multiselect",
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    const GenericTextField(
                      title: "Biotipo",
                      placeholder: "Deve ser um multiselect",
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    const GenericTextField(
                      title: "E-mail",
                      placeholder: "Insira seu E-mail aqui",
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    const GenericTextField(
                      title: "Senha",
                      placeholder: "Insira seu E-mail aqui",
                      width: double.infinity,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "© unlockway 2023",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                        color: Color(lightBglight),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
