import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/generic_form.dart';
import 'package:unlockway/components/utils/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/routine/routine.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({super.key});

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      appBar: AppBar(
        flexibleSpace: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 13),
          child: Row(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          navigationPageLeftAnimation(
                            const Routine(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back,
                          size: 26.0, color: Color(primarydark)),
                      label: Text(
                        'VOLTAR',
                        style: TextStyle(
                          color: Color(primarydark),
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset("assets/icon/mini.svg"),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(darkBgdark),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              GenericForm(
                  title: "Nome",
                  placeholder: "Insira um nome para a rotina",
                  width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }
}
