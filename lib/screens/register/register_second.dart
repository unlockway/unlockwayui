import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/form_progress.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/handlers/register.dart';
import 'package:unlockway/screens/register/register.dart';

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
  final String meta;
  final String email;

  final String biotype;

  @override
  State<RegisterSecond> createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final senhaController = TextEditingController();
    final senhaRepeatController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 13),
          padding: const EdgeInsets.all(22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    navigationPageLeftAnimation(
                      RegisterScreen(
                        altura: widget.altura,
                        biotype: widget.biotype,
                        email: emailController.toString(),
                        lastname: widget.lastname,
                        meta: widget.meta,
                        name: widget.name,
                        peso: widget.peso,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 26.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Voltar'.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/logo_mini.svg",
                width: 28,
                height: 28,
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 80,
      ),
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
          Form(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
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
                  GenericTextField(
                    placeholder: "*******",
                    title: "Senha",
                    width: double.infinity,
                    controller: senhaController,
                    number: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GenericTextField(
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
                      widget.email,
                      senhaController.toString(),
                      widget.altura,
                      widget.peso,
                      widget.meta,
                      widget.biotype,
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward_outlined),
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
