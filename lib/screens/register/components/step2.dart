import 'package:flutter/material.dart';
import 'package:unlockway/components/text_field.dart';

typedef GoalsCallback = void Function(List<String> goals);
typedef BiotypeCallback = void Function(String? biotype);

class RegisterStep2 extends StatelessWidget {
  const RegisterStep2({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextField(
          placeholder: "Insira seu melhor e-mail",
          title: "E-mail",
          width: double.infinity,
          controller: emailController,
          number: false,
        ),
        const SizedBox(
          height: 20,
        ),
        PasswordTextField(
          placeholder: "*******",
          title: "Senha",
          width: double.infinity,
          controller: passwordController,
          number: false,
        ),
        const SizedBox(
          height: 20,
        ),
        PasswordTextField(
          placeholder: "*******",
          title: "Confirmar senha",
          width: double.infinity,
          controller: confirmPasswordController,
          number: false,
        ),
      ],
    );
  }
}
