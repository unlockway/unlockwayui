import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/handlers/recommendation.handlers.dart';
import 'package:unlockway/models/recommendation.dart';

class RecommendationNotifyPopup extends StatelessWidget {
  const RecommendationNotifyPopup({
    super.key,
    required this.patientCommentController,
    required this.recommendation,
  });

  final TextEditingController patientCommentController;
  final RecommendationModel recommendation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Porque você deseja negar essa recomendação?",
              style: TextStyle(
                fontFamily: "Inter",
                color: Theme.of(context).colorScheme.outline,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldSimpleMultline(
            controller: patientCommentController,
            width: double.infinity,
            title: "",
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonFilledDanger(
            text: "NEGAR",
            height: 50,
            width: double.infinity,
            onTap: () {
              denyRecommendationAPI(
                context,
                recommendation.id,
                patientCommentController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
