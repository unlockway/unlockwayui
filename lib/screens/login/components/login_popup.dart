import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/screens/home/home.dart';

class LoginPopup extends StatelessWidget {
  const LoginPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const GenericTextField(
                  title: "E-mail",
                  placeholder: "Insira seu E-mail",
                  width: double.infinity),
              const SizedBox(height: 20),
              const GenericTextField(
                  title: "Senha",
                  placeholder: "********",
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
                      text: "Entrar",
                      height: 48.0,
                      width: 600.0,
                      onTap: () {
                        Navigator.of(context).push(
                          navigationPageRightAnimation(
                            const Home(),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
