import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/buttons.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color(darkBgdark),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: SvgPicture.asset(
                    "assets/icon/Logo.svg",
                  ),
                ),
                const Button("Entrar"),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'ou registre-se',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' aqui',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icon/Google.png"),
                        iconSize: 45,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icon/Microsoft.png"),
                        iconSize: 45,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Image.asset("assets/icon/Vector.png"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("assets/icon/Vectortwo.png"),
        ),
      ],
    );
  }
}
