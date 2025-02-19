import 'package:flutter/material.dart';
import 'package:unlockway/screens/patient/components/patient_bottom_navigator.dart';
import 'package:unlockway/handlers/history.handlers.dart';
import 'package:unlockway/handlers/nutri.handlers.dart';
import 'package:unlockway/models/history.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/patient/components/patient_history.dart';
import 'package:unlockway/screens/patient/components/patient_meals.dart';
import 'package:unlockway/screens/patient/components/patient_routines.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({
    super.key,
    required this.patient,
  });

  final UserModel patient;

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  List<MealsModel> mealList = [];
  List<HistoryModel> historyList = [];
  List<RoutineModel> routineList = [];
  String atual = "Meal";

  bool isLoading = true;

  void initialOperation() async {
    List<MealsModel> patientMeals =
        await getPatientMealsAPI(context, widget.patient.id!);
    List<HistoryModel> patientHistory =
        await getPatientHistoryAPI(context, widget.patient);
    List<RoutineModel> patientRoutines =
        await getPatientRoutinesAPI(context, widget.patient);

    setState(() {
      mealList = patientMeals;
      historyList = patientHistory;
      routineList = patientRoutines;
      isLoading = false;
    });
  }

  @override
  void initState() {
    initialOperation();
    super.initState();
  }

  onPageChange(int index) {
    setState(() {
      if (index == 1) {
        atual = "Meal";
      } else if (index == 2) {
        atual = "Routine";
      } else if (index == 3) {
        atual = "History";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          atual == "Meal"
              ? "Refeições"
              : atual == "Routine"
                  ? "Rotinas"
                  : "Histórico",
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
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: PatientBottomNavigator(
        atual: atual,
        onPageChange: onPageChange,
      ),
      body: Container(
        margin: const EdgeInsets.only(
          bottom: 40,
          left: 16,
          right: 16,
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : atual == "Meal"
                ? PatientMeals(
                    patientMeals: mealList,
                  )
                : atual == "Routine"
                    ? PatientRoutine(
                        patientMeals: mealList,
                        patientRoutines: routineList,
                      )
                    : PatientHistory(
                        patientHistory: historyList,
                      ),
      ),
    );
  }
}
