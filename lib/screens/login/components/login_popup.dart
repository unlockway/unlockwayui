import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/generic_form.dart';
import 'package:unlockway/components/utils/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home/home.dart';

class LoginPopup extends StatelessWidget {
  const LoginPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      child: Container(
        height: 450,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Color(darkBgdark),
          boxShadow: [
            BoxShadow(
              color: Color(darkBglight),
            ),
            BoxShadow(
              color: Color(darkBglight),
              spreadRadius: 4.0,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const GenericForm(
                    title: "E-mail",
                    placeholder: "Insira seu E-mail",
                    width: double.infinity),
                const SizedBox(height: 20),
                const GenericForm(
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
                      },
                    ),
                    const SizedBox(width: 10),
                    ButtonFilled(
                      text: "Entrar",
                      height: 48.0,
                      width: 600.0,
                      onTap: () {
                        navigatePage(
                          context,
                          const Home(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
