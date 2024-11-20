import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home/home.dart';

class ButtonFilled extends StatelessWidget {
  const ButtonFilled(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.onTap,
      this.onRequest});

  final String text;
  final double height;
  final double width;
  final void Function() onTap;
  final bool? onRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
          onTap: onRequest == true ? () {} : onTap,
          child: Center(
            child: onRequest == true
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.outline,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: Color(darkBgdark),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class ButtonFilledDanger extends StatelessWidget {
  const ButtonFilledDanger({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.onTap,
  });

  final String text;
  final double height;
  final double width;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(danger),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.onTap,
    required this.color,
    this.onRequest,
  });

  final Color color;
  final String text;
  final double height;
  final double width;
  final void Function() onTap;
  final bool? onRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: color,
        ),
        color: Colors.black.withOpacity(0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onRequest == true ? () {} : onTap,
          child: Center(
            child: onRequest == true
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.outline,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: color,
                      fontFamily: "Inter",
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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline,
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigatePage(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/imgs/google.png",
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Entrar com Google",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
