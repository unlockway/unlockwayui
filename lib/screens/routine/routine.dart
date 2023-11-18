import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/routine.dart';
import 'package:unlockway/screens/routine/components/filter_routine_popup.dart';
import 'package:unlockway/screens/routine/components/new_routine_page.dart';
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
          iconColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.outline),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ROTINAS",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        color: Theme.of(context).colorScheme.outline),
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
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        decoration: InputDecoration(
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onBackground,
                          contentPadding: const EdgeInsets.all(10.0),
                          hintText: "Buscar",
                          suffixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
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
                          color: Theme.of(context).colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          //borderRadius: BorderRadius.circular(100.0),
                          onTap: () => modalBuilderBottomAnimation(
                            context,
                            const FilterRoutinePopup(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.filter_list,
                              size: 25.0,
                              color: Theme.of(context).colorScheme.outline,
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
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: const UBottomNavigator("Routine"),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: routine.isNotEmpty
            ? SingleChildScrollView(
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
                        color: Theme.of(context).colorScheme.onBackground,
                        using: routine[i].inUsage,
                      );
                    },
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    PhosphorIcons.timer(PhosphorIconsStyle.regular),
                    size: 150,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 28,
                    ),
                    child: Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Não há rotinas criadas, crie sua primeira rotina para que ela seja listada aqui.",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontFamily: "Inter",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
