import 'package:flutter/material.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/screens/login/components/login_popup.dart';
import 'package:unlockway/screens/register/register.dart';

class InitialLogin extends StatefulWidget {
  const InitialLogin({super.key});

  @override
  State<InitialLogin> createState() => _InitialLoginState();
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(
        1.0,
        0.0,
      );
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _InitialLoginState extends State<InitialLogin> {
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
                    "assets/svgs/logo.svg",
                  ),
                ),
                ButtonFilled(
                  text: "Entrar",
                  height: 48.0,
                  width: 240.0,
                  onTap: () => dialogBuilderBottomAnimation(
                    context,
                    const LoginPopup(),
                  ),
                ),
                const SizedBox(height: 15),
                ButtonOutlined(
                    text: "Criar Conta",
                    height: 48.0,
                    width: 240.0,
                    onTap: () {
                      Navigator.of(context).push(
                        _createRoute(
                          const RegisterScreen(),
                        ),
                      );
                    }),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 80.0, right: 20.0),
                        child: const Divider(
                          color: Color.fromARGB(255, 180, 179, 179),
                          height: 36,
                        )),
                  ),
                  const Text(
                    "Ou",
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 179, 179),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 80.0),
                        child: const Divider(
                          color: Color.fromARGB(255, 180, 179, 179),
                          height: 36,
                        )),
                  ),
                ]),
                const GoogleButton(),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Image.asset("assets/imgs/top_left_vector.png"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("assets/imgs/bottom_right_vector.png"),
        ),
      ],
    );
  }
}
