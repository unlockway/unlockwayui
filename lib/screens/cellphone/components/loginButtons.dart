import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/cellphone/pages/home.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.text, {super.key});

  final String text;

  void navigatePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Home();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 240,
        height: 48.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(primary),
              const Color.fromARGB(255, 171, 216, 77)
            ]),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.5),
                blurRadius: 1.5,
              ),
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              navigatePage(context);
            },
            child: const Center(
              child: Text("Entrar",
                  style:
                      TextStyle(fontSize: 23.04, fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  void navigatePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Home();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: Color(primary),
        ),
        color: Colors.black.withOpacity(0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigatePage(context);
          },
          child: Center(
            child: Text(
              "Criar Conta",
              style: TextStyle(
                fontSize: 23.04,
                fontWeight: FontWeight.w500,
                color: Color(primary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  void navigatePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Home();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 48.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(primary)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigatePage(context);
          },
          child: const Center(
            child: Text("Criar Conta",
                style: TextStyle(fontSize: 23.04, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
