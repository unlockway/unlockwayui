import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/cellphone/components/generic_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Row(children: [
          SizedBox(
            child: Row(children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Color(primary)),
                onPressed: () {},
              ),
              Text("VOLTAR",
                  style: TextStyle(color: Color(primary), fontSize: 16)),
              SvgPicture.asset("assets/icon/LogoMini.svg",
                  width: 40, height: 40),
            ]),
          ),
        ]),
        elevation: 0,
        backgroundColor: const Color(0xFF1B232A),
      ),
      body: Stack(children: [
        Positioned(
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset("assets/icon/registerBg.svg",
              fit: BoxFit.fill, height: MediaQuery.of(context).size.height),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const Column(
              children: [
                GenericForm(
                  placeholder: "Insira seu nome, ex: Marcela",
                  title: "Nome",
                ),
                SizedBox(
                  height: 20,
                ),
                GenericForm(
                  placeholder: "Insira seu sobrenome, ex: Fernandes",
                  title: "Sobrenome",
                ),
                SizedBox(
                  height: 20,
                ),
                GenericForm(
                  placeholder: "Diga-nos qual seu objetivo",
                  title: "Meta",
                ),
              ],
            )),
      ]),
    );
  }
}
