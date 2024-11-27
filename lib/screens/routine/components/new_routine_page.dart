import 'package:flutter/material.dart';
import 'package:unlockway/components/app_bar.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/meals.handlers.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/handlers/suggestions.handlers.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/models/relations/routine_meal_on_creation.dart';
import 'package:unlockway/models/routine_suggestion.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/routine/components/routine_meal_card.dart';
import 'package:unlockway/screens/routine/components/routine_meal_popup.dart';

class NewRoutine extends StatefulWidget {
  const NewRoutine({
    super.key,
    required this.name,
    required this.meals,
    required this.inUsage,
    required this.weekRepetitions,
    required this.routineId,
    required this.patientMeals,
    this.onRecommendation,
    this.recommendation,
    this.routineSuggestion,
    this.noEdit,
  });

  final String? name;
  final List<RoutineMealOnCreation> meals;
  final bool? inUsage;
  final List<bool>? weekRepetitions;
  final String? routineId;
  final List<MealsModel>? patientMeals;
  final Function? onRecommendation;
  final RecommendationModel? recommendation;
  final RoutineSuggestion? routineSuggestion;
  final bool? noEdit;

  @override
  State<NewRoutine> createState() => _NewRoutineState();
}

class _NewRoutineState extends State<NewRoutine> {
  UserModel user = userData;
  bool onSaveRequest = false;
  bool onDeleteRequest = false;

  List<MealsModel> mealsList = [];
  bool _isLoading = true;

  final nameController = TextEditingController();
  List<RoutineMealOnCreation> mealsSelectedToRoutine = [];
  List<bool> daysSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void fetchAllMeals() async {
    var result = await getMealsAPI(context);

    setState(() {
      mealsList = result;
      _isLoading = false;
    });
  }

  void fetchAllPatientMeals() async {
    var result = widget.patientMeals!;

    setState(() {
      mealsList = result;
      _isLoading = false;
    });
  }

  changeDays(int dayID) {
    daysSelected[dayID] = !daysSelected[dayID];
  }

  saveToRoutineMeals(String idMeal, String notifyAt) {
    setState(() {
      mealsSelectedToRoutine.add(
        RoutineMealOnCreation(idMeal: idMeal, notifyAt: notifyAt),
      );
    });
  }

  removeFromRoutineMeals(int index) {
    setState(() {
      mealsSelectedToRoutine.removeAt(index);
    });
  }

  editFromRoutineMeals(String idMeal, String notifyAt, int index) {
    setState(() {
      mealsSelectedToRoutine[index] =
          RoutineMealOnCreation(idMeal: idMeal, notifyAt: notifyAt);
    });
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();

    widget.patientMeals != null ? fetchAllPatientMeals() : fetchAllMeals();
    if (widget.name != null) {
      nameController.text = widget.name!;
      daysSelected = widget.weekRepetitions!;
      mealsSelectedToRoutine = widget.meals;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.noEdit == true
          ? null
          : Container(
              margin: const EdgeInsets.all(10),
              child: widget.name != null
                  ? Row(
                      children: [
                        Flexible(
                          child: ButtonOutlined(
                            onRequest: onDeleteRequest,
                            text: "EXCLUIR ROTINA",
                            height: 48,
                            width: double.infinity,
                            onTap: () {
                              setState(() {
                                onDeleteRequest = true;
                              });
                              widget.recommendation != null
                                  ? deleteRoutineSuggestionAPI(
                                      context,
                                      widget.routineSuggestion!.id,
                                    ).then((onValue) {
                                      widget.onRecommendation!();
                                    })
                                  : deleteRoutineAPI(
                                      context,
                                      user.token!,
                                      widget.routineId!,
                                    );
                              setState(() {
                                onDeleteRequest = false;
                              });
                            },
                            color: Color(danger),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: ButtonFilled(
                            onRequest: onSaveRequest,
                            text: "EDITAR ROTINA",
                            height: 48,
                            width: double.infinity,
                            onTap: () {
                              setState(() {
                                onSaveRequest = true;
                              });
                              widget.recommendation != null
                                  ? editRoutineSuggestionAPI(
                                      context,
                                      widget.recommendation!.id,
                                      nameController.text,
                                      widget.inUsage!,
                                      mealsSelectedToRoutine,
                                      daysSelected,
                                      widget.routineId,
                                      widget.routineSuggestion!.id,
                                    ).then((value) {
                                      widget.onRecommendation!();
                                    })
                                  : editRoutineAPI(
                                      context,
                                      nameController.text,
                                      widget.inUsage!,
                                      mealsSelectedToRoutine,
                                      daysSelected,
                                      widget.routineId!,
                                    );
                              setState(() {
                                onSaveRequest = false;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Flexible(
                          child: ButtonFilled(
                            onRequest: onSaveRequest,
                            text: "CRIAR ROTINA",
                            height: 48,
                            width: double.infinity,
                            onTap: () {
                              setState(() {
                                onSaveRequest = true;
                              });
                              widget.onRecommendation != null
                                  ? createRoutineSuggestionsAPI(
                                      context,
                                      nameController.text,
                                      false,
                                      widget.recommendation!.id,
                                      "",
                                      mealsSelectedToRoutine,
                                      daysSelected,
                                    ).then((value) {
                                      widget.onRecommendation!();
                                    })
                                  : createRoutineAPI(
                                      context,
                                      user.id!,
                                      user.token!,
                                      nameController.text,
                                      false,
                                      mealsSelectedToRoutine,
                                      daysSelected,
                                    );
                              setState(() {
                                onSaveRequest = false;
                              });
                            },
                          ),
                        ),
                      ],
                    )),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: registerAppBar(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // Parte superior: Nome e seleção de dias
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    GenericTextField(
                      title: "Nome",
                      placeholder: "Insira um nome para a rotina",
                      width: double.infinity,
                      controller: nameController,
                      number: false,
                    ),
                    const SizedBox(height: 20),
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
                      days: daysSelected,
                      enable: true,
                      function: (int dayID) => changeDays(dayID),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              // Parte inferior: GridView com scroll independente
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : mealsSelectedToRoutine.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: GridView.builder(
                              // Adiciona uma chave única para o GridView
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    constraints.maxWidth > 600 ? 2 : 1,
                                childAspectRatio: constraints.maxWidth /
                                    (constraints.maxHeight / 3),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: mealsSelectedToRoutine.length,
                              itemBuilder: (context, index) {
                                List<MealsModel> filteredMeal = mealsList
                                    .where((meal) =>
                                        meal.id ==
                                        mealsSelectedToRoutine[index].idMeal)
                                    .toList();

                                return RoutineMealCard(
                                  index: index,
                                  mealId: filteredMeal[0].id,
                                  editMethod: editFromRoutineMeals,
                                  removeMethod: removeFromRoutineMeals,
                                  category: filteredMeal[0].category,
                                  meal: filteredMeal[0].name,
                                  hour: formatTimeOfDay(TimeOfDay(
                                    hour: int.parse(
                                        mealsSelectedToRoutine[index]
                                            .notifyAt!
                                            .split(":")[0]),
                                    minute: int.parse(
                                        mealsSelectedToRoutine[index]
                                            .notifyAt!
                                            .split(":")[1]),
                                  )),
                                  mealsList: mealsList,
                                  calories: filteredMeal[0].totalCalories,
                                  imgURL: filteredMeal[0].photo ?? "",
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: Text("Nenhuma refeição selecionada."),
                          ),
              ),
              // Botão "Novo" alinhado ao final
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      widget.noEdit == true
                          ? null
                          : modalBuilderBottomAnimation(
                              context,
                              RoutineMealPopup(
                                index: null,
                                mealId: null,
                                category: '',
                                hour: TimeOfDay.now(),
                                selectedMeal: '',
                                mealsList: mealsList,
                                editMethod: (String idMeal, String notifyAt,
                                    int index) {
                                  editFromRoutineMeals(
                                    idMeal,
                                    notifyAt,
                                    index,
                                  );
                                },
                                saveMethod: (String idMeal, String notifyAt) {
                                  saveToRoutineMeals(
                                    idMeal,
                                    notifyAt,
                                  );
                                },
                                removeMethod: (int index) {
                                  removeFromRoutineMeals(
                                    index,
                                  );
                                },
                              ),
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
                      iconColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary,
                      ),
                      iconSize: const WidgetStatePropertyAll(16),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
