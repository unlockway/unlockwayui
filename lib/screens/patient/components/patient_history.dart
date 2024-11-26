import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/screens/patient/components/patient_bottom_navigator.dart';
import 'package:unlockway/handlers/history.handlers.dart';
import 'package:unlockway/models/history.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/screens/history/components/history_card.dart';
import 'package:unlockway/screens/recommendations/recommendations.dart';

class PatientHistory extends StatelessWidget {
  const PatientHistory({
    super.key,
    required this.patientHistory,
  });

  final List<HistoryModel> patientHistory;

  @override
  Widget build(BuildContext context) {
    return patientHistory.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemCount: patientHistory.length,
              itemBuilder: (context, index) {
                HistoryModel actualHistory = patientHistory[index];
                return HistoryCard(
                  name: actualHistory.routineName,
                  weekRepetitions: actualHistory.days,
                  calories: actualHistory.calories,
                  date: actualHistory.date,
                  meals: actualHistory.ingestedMeals,
                  color: Theme.of(context).colorScheme.onSurface,
                );
              },
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                PhosphorIcons.scroll(PhosphorIconsStyle.regular),
                size: 150,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 28),
                child: SizedBox(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Não há nenhum histórico atualmente, conforme o uso do app serão gerados relatórios sobre suas ações.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                      fontFamily: "Inter",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
