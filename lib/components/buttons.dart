import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home.dart';

class Button extends StatelessWidget {
  const Button(this.text, {super.key});

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
