import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/handlers/login.handlers.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({super.key});

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  bool onRequest = false;
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

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
                  Flexible(
                    child: ButtonOutlined(
                      onRequest: onRequest,
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
                      text: "Entrar",
                      height: 48.0,
                      width: 200,
                      onTap: () async {
                        setState(() {
                          onRequest = true;
                        });
                        await loginAPI(
                          context,
                          emailController.text,
                          senhaController.text,
                        );
                        setState(() {
                          onRequest = false;
                        });
                      },
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
