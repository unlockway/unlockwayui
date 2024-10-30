import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/handlers/meals.handlers.dart';
import 'package:unlockway/handlers/routine.handlers.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/home/components/client_info_card.dart';
import 'package:unlockway/screens/home/components/weekly_bar_chart.dart';

class ClientInfo extends StatefulWidget {
  final UserModel user;

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
  bool _isLoading = true;

  Future<void> fetchClientInfo() async {
    List<MealsModel> mealResult = await getPatientMealsAPI(context, "");
    List<RoutineModel> routineResult = await getPatientRoutinesAPI(context);

    setState(() {
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
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ClientInfoCard(user: widget.user),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonFilled(
                        text: "Rotinas e Refeições",
                        height: 120,
                        width: 165,
                        onTap: () {}),
                    ButtonFilled(
                        text: "Recomendações",
                        height: 120,
                        width: 165,
                        onTap: () {}),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  child: ButtonFilled(
                      text: "Histórico", height: 120, width: 165, onTap: () {}),
                ),
                const SizedBox(height: 30),
                const WeeklyBarChart(
                    weeklyValues: [10, 20, 30, 4000, 50, 60, 7000]),
              ],
            ),
    );
  }
}
