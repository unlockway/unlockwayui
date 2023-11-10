import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/screens/login/components/login_popup.dart';
import 'package:unlockway/screens/register/register.dart';

class InitialLogin extends StatefulWidget {
  const InitialLogin({super.key});

  @override
  State<InitialLogin> createState() => _InitialLoginState();
}

class _InitialLoginState extends State<InitialLogin> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: Theme.of(context).colorScheme.outline == Colors.white
                      ? SvgPicture.asset(
                          "assets/svgs/logo.svg",
                        )
                      : SvgPicture.asset(
                          "assets/svgs/logo_light.svg",
                        ),
                ),
                ButtonFilled(
                  text: "Entrar",
                  height: 48.0,
                  width: 240.0,
                  onTap: () {
                    modalBuilderBottomAnimation(
                      context,
                      const LoginPopup(),
                    );
                  },
                ),
                const SizedBox(height: 15),
                ButtonOutlined(
                  text: "Criar Conta",
                  height: 48.0,
                  width: 240.0,
                  onTap: () {
                    Navigator.of(context).push(
                      navigationPageRightAnimation(
                        const RegisterScreen(
                          name: '',
                          lastname: '',
                          peso: 0.0,
                          altura: 0.0,
                          meta: '',
                          email: '',
                          goal: '',
                          biotype: '',
                        ),
                      ),
                    );
                  },
                  color: Theme.of(context).colorScheme.primary,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 80.0, right: 20.0),
                        child: Divider(
                          color: Theme.of(context).colorScheme.outline,
                          height: 36,
                        ),
                      ),
                    ),
                    Text(
                      "Ou",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Divider(
                          color: Theme.of(context).colorScheme.outline,
                          height: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                const GoogleButton(),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Theme.of(context).colorScheme.outline == Colors.white
              ? Image.asset("assets/imgs/top_left_vector.png")
              : Image.asset("assets/imgs/top_left_vector_light.png"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Theme.of(context).colorScheme.outline == Colors.white
              ? Image.asset("assets/imgs/bottom_right_vector.png")
              : Image.asset("assets/imgs/bottom_right_vector_light.png"),
        ),
      ],
    );
  }
}
