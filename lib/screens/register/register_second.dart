import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/form_progress.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/handlers/register.dart';
import 'package:unlockway/screens/register/components/app_bar.dart';

class RegisterSecond extends StatefulWidget {
  const RegisterSecond({
    super.key,
    required this.name,
    required this.lastname,
    required this.peso,
    required this.altura,
    required this.meta,
    required this.email,
    required this.biotype,
  });

  final String name;
  final String lastname;
  final double peso;
  final double altura;
  final List<String> meta;
  final String email;
  final String biotype;

  @override
  State<RegisterSecond> createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var senhaController = TextEditingController();
    var senhaRepeatController = TextEditingController();

    if (widget.email != '') {
      emailController = TextEditingController(
        text: widget.email,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: registerAppBar(context),
      body: Stack(
        children: <Widget>[
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: Theme.of(context).colorScheme.outline == Colors.white
                ? SvgPicture.asset("assets/svgs/register_bg.svg",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height)
                : SvgPicture.asset("assets/svgs/register_bg_light.svg",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Form(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const FormProgress(
                        steps: 2,
                        now: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        controller: senhaController,
                        number: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextField(
                        placeholder: "*******",
                        title: "Confirmar senha",
                        width: double.infinity,
                        controller: senhaRepeatController,
                        number: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, bottom: 20),
              width: 130,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    const Color.fromARGB(255, 171, 216, 77)
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    registerAPI(
                      context,
                      widget.name,
                      widget.lastname,
                      emailController.text,
                      senhaController.text,
                      widget.altura,
                      widget.peso,
                      widget.meta,
                      widget.biotype,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
