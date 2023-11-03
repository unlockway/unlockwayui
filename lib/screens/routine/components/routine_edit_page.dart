import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/screens/routine/components/new_routine_meal_popup.dart';
import 'package:unlockway/screens/routine/components/routine_meal_card.dart';
import 'package:unlockway/screens/routine/routine.dart';

class EditRoutine extends StatefulWidget {
  const EditRoutine({
    super.key,
    required this.days,
    required this.meals,
  });

  final List<bool> days;
  final List<Object> meals;

  @override
  State<EditRoutine> createState() => _EditRoutineState();
}

class _EditRoutineState extends State<EditRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: TextButton.icon(
        onPressed: () {
          modalBuilderBottomAnimation(
            context,
            const NewRoutineMealPopup(),
          );
        },
        icon: const Icon(Icons.add),
        label: Text(
          "Novo",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ButtonStyle(
          iconColor: MaterialStatePropertyAll(
            Theme.of(context).colorScheme.primary,
          ),
          iconSize: const MaterialStatePropertyAll(16),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            ButtonFilled(
              text: "ATUALIZAR ROTINA",
              height: 48,
              width: double.infinity,
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
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
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      label: Text(
                        'VOLTAR',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
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
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            const GenericTextField(
              title: "Nome",
              placeholder: "Insira um nome para a rotina",
              width: double.infinity,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Selecione os dias que a rotina deve ocorrer",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                DaysList(
                  days: widget.days,
                  enable: true,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                      widget.meals.length,
                      (i) {
                        var mealInfo = widget.meals[i] as Map;
                        return RoutineMealCard(
                          category: mealInfo['category'],
                          meal: mealInfo['name'],
                          hour: mealInfo['notifyAt'],
                          calories: mealInfo['totalCalories'],
                          imgURL: mealInfo['photo'],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
