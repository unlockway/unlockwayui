import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';

class Button extends StatelessWidget {
  const Button(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 240,
        height: 48.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primary, const Color.fromARGB(255, 171, 216, 77)]),
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
              onTap: () {},
              child: const Center(
                child: Text("Entrar",
                    style: TextStyle(
                        fontSize: 23.04, fontWeight: FontWeight.w500)),
              )),
        ),
      ),
    );

    /*TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding:
            const EdgeInsets.only(left: 70, right: 70, top: 15, bottom: 15),
        backgroundColor: primary,
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(text,
          style: const TextStyle(
              color: Color.fromARGB(255, 19, 19, 19),
              fontWeight: FontWeight.w500,
              fontSize: 28)),
    ); */
  }
}
