import 'package:flutter/material.dart';
import 'package:unlockway/components/text_field.dart';

typedef SexCallback = void Function(String? sex);

class NutritionistRegisterStep extends StatefulWidget {
  const NutritionistRegisterStep({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.cfnController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController cfnController;
  final TextEditingController confirmPasswordController;

  @override
  State<NutritionistRegisterStep> createState() =>
      _NutritionistRegisterStepState();
}

class _NutritionistRegisterStepState extends State<NutritionistRegisterStep> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericTextField(
          placeholder: "Insira seu nome, ex: Marcela",
          title: "Nome",
          width: double.infinity,
          number: false,
          controller: widget.firstNameController,
        ),
        const SizedBox(height: 20),
        GenericTextField(
          placeholder: "Insira seu sobrenome, ex: Fernandes",
          title: "Sobrenome",
          width: double.infinity,
          number: false,
          controller: widget.lastNameController,
        ),
        const SizedBox(height: 20),
        GenericTextField(
          placeholder: "Insira seu melhor e-mail",
          title: "E-mail",
          width: double.infinity,
          controller: widget.emailController,
          number: false,
        ),
        const SizedBox(
          height: 20,
        ),
        PasswordTextField(
          placeholder: "*******",
          title: "Senha",
          width: double.infinity,
          controller: widget.passwordController,
          number: false,
        ),
        const SizedBox(
          height: 20,
        ),
        PasswordTextField(
          placeholder: "*******",
          title: "Confirmar senha",
          width: double.infinity,
          controller: widget.confirmPasswordController,
          number: false,
        ),
        const SizedBox(height: 20),
        GenericTextField(
          placeholder: "Insira o número do seu registro CFN",
          title: "CFN",
          width: double.infinity,
          number: true,
          controller: widget.cfnController,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
