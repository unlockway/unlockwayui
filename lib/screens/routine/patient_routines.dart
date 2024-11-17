import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/patient_bottom_navigator.dart';
import 'package:unlockway/handlers/nutri.handlers.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/models/relations/routine_meal_on_creation.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/recommendations/recommendations.dart';
import 'package:unlockway/screens/routine/components/routine_card.dart';

class PatientRoutine extends StatefulWidget {
  const PatientRoutine({
    super.key,
    required this.patient,
  });

  final PatientUserModel patient;

  @override
  State<PatientRoutine> createState() => _PatientRoutineState();
}

class _PatientRoutineState extends State<PatientRoutine> {
  List<RoutineModel> routineList = [];
  bool _isLoading = true;
  Timer? _debounceTimer;

  void fetchAllRoutines() async {
    var result = await getPatientRoutinesAPI(context, widget.patient);

    setState(() {
      routineList = result;
      _isLoading = false;
    });
  }

  changeUsedRoutine(String userId, String routineId) {
    setState(() {
      fetchAllRoutines();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAllRoutines();
  }

  @override
  void dispose() {
    super.dispose();

    _isLoading = false;
    routineList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          centerTitle: true,
          title: Text(
            "ROTINAS",
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.bold,
              fontFamily: "Inter",
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.outline,
            onPressed: () {
              navigatePage(context, Recommendations(patient: widget.patient));
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TextField(
                          onChanged: (value) {
                            _onTextChanged(value);
                          },
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
                            fillColor: Theme.of(context).colorScheme.onSurface,
                            contentPadding: const EdgeInsets.all(10.0),
                            hintText: "Buscar",
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                              fontWeight: FontWeight.w100,
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
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar:
          PatientBottomNavigator("Routine", patient: widget.patient),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : routineList.isNotEmpty
                ? LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return CustomScrollView(
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: constraints.maxHeight),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 1.6,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                shrinkWrap: true,
                                itemCount: routineList.length,
                                itemBuilder: (context, index) {
                                  var routineIndex = routineList[index];

                                  List<RoutineMealOnCreation> filteredMeals =
                                      [];
                                  for (var element in routineIndex.meals) {
                                    filteredMeals.add(
                                      RoutineMealOnCreation(
                                        idMeal: element.mealId,
                                        notifyAt: element.notifyAt,
                                      ),
                                    );
                                  }

                                  return RoutineCard(
                                    patientMeals: null,
                                    fetchRoutine: fetchAllRoutines,
                                    routineId: routineIndex.id,
                                    name: routineIndex.name,
                                    weekRepetitions:
                                        routineIndex.weekRepetitions,
                                    calories:
                                        routineIndex.totalCaloriesInTheDay,
                                    meals: filteredMeals,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    using: routineIndex.inUsage,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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

  void _onTextChanged(String value) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      List<RoutineModel> resultName = await getRoutineByNameAPI(context, value);
      setState(() {
        routineList = resultName;
      });
    });
  }
}
