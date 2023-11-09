import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/handlers/register.dart';
import 'package:unlockway/screens/login/login.dart';
import 'package:unlockway/screens/register/components/register_initial.dart';
import 'package:unlockway/screens/register/components/register_second.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int phase = 1;
  String buttonText = "Seguir";
  Widget registerPhase = const RegisterInitial(
    altura: 0,
    lastname: '',
    meta: '',
    name: '',
    peso: 0,
  );
  var navigate = (BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Login();
        },
      ),
    );
  };

  @override
  Widget build(BuildContext context) {
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
                  navigate(context);
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
            child: registerPhase,
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
                      "Daniel",
                      "Vieira",
                      "destroer2828@gmail.com",
                      "KoomSusser2828",
                      1.84,
                      84,
                      "GAIN_MUSCULAR_MASS",
                      "ECTOMORPH",
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonText,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.arrow_forward_outlined),
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
