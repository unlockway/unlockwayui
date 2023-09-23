import 'package:flutter/material.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/routine.dart';
import 'package:unlockway/screens/routine/components/filter_routine_popup.dart';
import 'package:unlockway/screens/routine/components/new_routine_popup.dart';
import 'package:unlockway/screens/routine/components/routine_card.dart';

class Routine extends StatefulWidget {
  const Routine({super.key});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            navigationPageRightAnimation(
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
        child: SafeArea(
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
                          onTap: () => modalBuilderBottomAnimation(
                            context,
                            const FilterRoutinePopup(),
                          ),
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
      ),
      backgroundColor: Color(darkBgdark),
      bottomNavigationBar: const UBottomNavigator("Routine"),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(
              routine.length,
              (i) {
                return RoutineCard(
                  name: routine[i].name,
                  weekRepetitions: routine[i].weekRepetitions,
                  calories: routine[i].totalCaloriesInTheDay,
                  meals: routine[i].meals,
                  color: Color(darkBglight),
                  using: routine[i].inUsage,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
