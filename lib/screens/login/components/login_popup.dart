import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/handlers/login.handlers.dart';

class LoginPopup extends StatelessWidget {
  const LoginPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final senhaController = TextEditingController();

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
              GenericTextField(
                title: "E-mail",
                placeholder: "Insira seu E-mail",
                width: double.infinity,
                controller: emailController,
                number: false,
              ),
              const SizedBox(height: 20),
              PasswordTextField(
                title: "Senha",
                placeholder: "********",
                width: double.infinity,
                controller: senhaController,
                number: false,
              ),
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
                    },
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  ButtonFilled(
                    text: "Entrar",
                    height: 48.0,
                    width: 600.0,
                    onTap: () {
                      loginAPI(
                        context,
                        emailController.text,
                        senhaController.text,
                      );
                    },
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
