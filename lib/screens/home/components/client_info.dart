import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/handlers/nutri.handlers.dart';
import 'package:unlockway/models/home_data.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/screens/home/components/client_info_card.dart';
import 'package:unlockway/screens/home/components/weekly_bar_chart.dart';
import 'package:unlockway/screens/meals/patient_meals.dart';
import 'package:unlockway/screens/recommendations/recommendations.dart';

class ClientInfo extends StatefulWidget {
  final PatientUserModel user;

  const ClientInfo({
    super.key,
    required this.user,
  });

  @override
  State<ClientInfo> createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  List<RoutineModel> userRoutines = [];
  List<MealsModel> userMeals = [];
  HomeDataModel userHomeData = const HomeDataModel(
      meals: 0, routines: 0, notifications: 0, weekCalories: []);
  bool _isLoading = true;

  Future<void> fetchClientInfo() async {
    HomeDataModel homeDataResult =
        await getPatientHomeAnalysysAPI(context, widget.user.id!);
    List<MealsModel> mealResult =
        await getPatientMealsAPI(context, widget.user.id!);
    List<RoutineModel> routineResult =
        await getPatientRoutinesAPI(context, widget.user);

    setState(() {
      userHomeData = homeDataResult;
      userMeals = mealResult;
      userRoutines = routineResult;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchClientInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _isLoading
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                ClientInfoCard(user: widget.user),
                const SizedBox(height: 16),
                ButtonFilled(
                    text: "Detalhes do Paciente",
                    height: 120,
                    width: double.infinity,
                    onTap: () {
                      Navigator.of(context).push(
                        navigationPageRightAnimation(
                          PatientMeals(patient: widget.user),
                        ),
                      );
                    }),
                const SizedBox(height: 8),
                ButtonFilled(
                    text: "Recomendações",
                    height: 120,
                    width: double.infinity,
                    onTap: () {
                      Navigator.of(context).push(
                        navigationPageRightAnimation(
                          Recommendations(patient: widget.user),
                        ),
                      );
                    }),
                const SizedBox(height: 50),
                WeeklyBarChart(
                  weeklyValues: userHomeData.weekCalories,
                ),
              ],
            ),
    );
  }
}
