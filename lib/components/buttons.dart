import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/home.dart';

class ButtonFilled extends StatelessWidget {
  const ButtonFilled({
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
    return Flexible(
      child: Container(
        width: width,
        height: height,
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
            onTap: onTap,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 23.04,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter"),
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
  });

  final String text;
  final double height;
  final double width;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: height,
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
            onTap: onTap,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 23.04,
                    fontWeight: FontWeight.w500,
                    color: Color(primary),
                    fontFamily: "Inter"),
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
                "assets/icon/Google.png",
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
