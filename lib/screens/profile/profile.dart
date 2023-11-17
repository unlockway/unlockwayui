import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = userData;

    final nameController = TextEditingController(text: user.firstName);
    final lastnameController = TextEditingController(text: user.lastName);
    final pesoController = TextEditingController(text: user.weight.toString());
    final alturaController =
        TextEditingController(text: user.height.toString());
    final metaController = TextEditingController();
    final biotipoController = TextEditingController(text: user.biotype);
    final emailController = TextEditingController(text: user.email);
    final senhaController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(PhosphorIcons.regular.caretLeft),
        ),
        iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.outline, size: 32.0),
        title: Text(
          "Perfil".toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
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
                color: Theme.of(context).colorScheme.primary,
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
                    GenericTextField(
                      title: "Nome",
                      placeholder: "Insira seu nome aqui",
                      width: double.infinity,
                      controller: nameController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    GenericTextField(
                      title: "Sobrenome",
                      placeholder: "Insira seu sobrenome aqui",
                      width: double.infinity,
                      controller: lastnameController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: GenericTextField(
                            title: "Peso",
                            placeholder: "KG",
                            width: double.infinity,
                            controller: pesoController,
                            number: true,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: GenericTextField(
                            title: "Altura",
                            placeholder: "0,00",
                            width: double.infinity,
                            controller: alturaController,
                            number: false,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    GenericTextField(
                      title: "Meta",
                      placeholder: "Deve ser um multiselect",
                      width: double.infinity,
                      controller: metaController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    GenericTextField(
                      title: "Biotipo",
                      placeholder: "Deve ser um multiselect",
                      width: double.infinity,
                      controller: biotipoController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    GenericTextField(
                      title: "E-mail",
                      placeholder: "Insira seu E-mail aqui",
                      width: double.infinity,
                      controller: emailController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    GenericTextField(
                      title: "Nova Senha",
                      placeholder: "Digite nova senha",
                      width: double.infinity,
                      controller: senhaController,
                      number: false,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "© unlockway 2023",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.outline,
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
