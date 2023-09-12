import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/generic_form.dart';
import 'package:unlockway/components/new_routine.dart';

class Routine extends StatefulWidget {
  const Routine({super.key});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.topCenter,
          insetPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(darkBgdark),
              boxShadow: [
                BoxShadow(
                  color: Color(darkBglight),
                ),
                BoxShadow(
                  color: Color(darkBglight),
                  spreadRadius: 4.0,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const GenericForm(
                        title: "Categoria",
                        placeholder: "",
                        width: double.infinity),
                    const SizedBox(height: 20),
                    const GenericForm(
                        title: "Data de criação",
                        placeholder: "dd/mm/yyyy",
                        width: double.infinity),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonOutlined(
                            text: "Cancelar",
                            height: 48.0,
                            width: 600.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            }),
                        const SizedBox(width: 10),
                        ButtonFilled(
                          text: "Filtrar",
                          height: 48.0,
                          width: 600.0,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
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

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            _createRoute(
              const NewRoutine(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color(primarydark),
          ),
          iconColor: const MaterialStatePropertyAll(Colors.white),
        ),
        iconSize: 24,
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          margin:
              const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ROTINAS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextField(
                      cursorColor: const Color.fromARGB(255, 155, 155, 155),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Color(darkBglight),
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: "Buscar",
                        suffixIcon: Icon(
                          Icons.search,
                          color: Color(lightBglight),
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(lightBg),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Color(darkBglight),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        //borderRadius: BorderRadius.circular(100.0),
                        onTap: () => _dialogBuilder(context),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.filter_list,
                            size: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Routine"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(13),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Routine"),
          ],
        ),
      ),
    );
  }
}
