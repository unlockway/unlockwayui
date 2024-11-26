import 'package:flutter/material.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/handlers/recommendation.handlers.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/screens/notify/components/recommendation_meal_notify_card.dart';
import 'package:unlockway/screens/notify/components/recommendation_notify_popup.dart';
import 'package:unlockway/screens/notify/components/recommendation_routine_notify_card.dart';

class RecommendationDetails extends StatefulWidget {
  const RecommendationDetails({
    super.key,
    required this.recommendation,
  });

  final RecommendationModel recommendation;

  @override
  State<RecommendationDetails> createState() => _RecommendationDetailsState();
}

class _RecommendationDetailsState extends State<RecommendationDetails> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController patientCommentController = TextEditingController();

  @override
  void initState() {
    descriptionController.text = widget.recommendation.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  modalBuilderBottomAnimation(
                    context,
                    RecommendationNotifyPopup(
                      recommendation: widget.recommendation,
                      patientCommentController: patientCommentController,
                    ),
                  );
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.all(16),
                  ),
                  side: WidgetStateProperty.all(
                    BorderSide(
                      color: Theme.of(context).colorScheme.error,
                      width: 2,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text(
                  "NEGAR",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  acceptRecommendationAPI(
                    context,
                    widget.recommendation.id,
                    "",
                  );
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.all(16),
                  ),
                  side: WidgetStateProperty.all(
                    BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text(
                  "ACEITAR",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Theme.of(context).colorScheme.outline,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(
            "RECOMENDAÇÃO",
            style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Container(
          key: const ValueKey(0),
          height: double.infinity,
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Refeições",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.recommendation.mealSuggestions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: RecommendationMealNotifyCard(
                        mealSuggestion:
                            widget.recommendation.mealSuggestions[index],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rotinas",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.recommendation.routineSuggestions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: RecommendationRoutineNotifyCard(
                        routineSuggestion:
                            widget.recommendation.routineSuggestions[index],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Descrição",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFieldSimpleMultline(
                  enabled: false,
                  title: "Descrição",
                  width: double.infinity,
                  controller: descriptionController,
                ),
              ],
            ),
          ),
        ));
  }
}
