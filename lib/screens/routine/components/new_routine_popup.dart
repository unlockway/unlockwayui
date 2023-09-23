import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/components/navigation.dart';
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
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 0.0,
            right: 16.0,
            top: 16.0,
          ),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          navigationPageLeftAnimation(
                            const Routine(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 26.0,
                        color: Color(primarydark),
                      ),
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
        backgroundColor: Color(darkBgdark),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: const Form(
          child: Column(
            children: [
              GenericTextField(
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
