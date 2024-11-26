import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/handlers/recommendation.handlers.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/screens/recommendations/components/recommendation_card.dart';
import 'package:unlockway/screens/recommendations/recommendation.dart';

import '../../models/recommendation.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({super.key, required this.patient});

  final PatientUserModel patient;

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  TextEditingController searchController = TextEditingController();
  List<RecommendationModel> recommendations = [];
  bool _isLoading = true;
  Timer? _debounceTimer;

  void fetchRecommendations() {
    setState(() {
      _isLoading = true;
    });
    getPatientRecommendationAPI(context, widget.patient.id!).then((result) {
      setState(() {
        recommendations = result.reversed.toList();

        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    fetchRecommendations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RECOMENDAÇÕES",
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          children: [
            Row(
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
                        borderSide: const BorderSide(color: Colors.transparent),
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
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
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
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        navigationPageRightAnimation(
                          Recommendation(
                            recommendation: null,
                            patient: widget.patient,
                          ),
                        ),
                      ).then((onValue) {
                        fetchRecommendations();
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            _isLoading
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: recommendations.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RecommendationCard(
                            patient: widget.patient,
                            recommendation: recommendations[index],
                            onTap: fetchRecommendations,
                          ),
                        );
                      },
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
      List<RecommendationModel> resultName =
          await getPatientRecommendationByDescriptionAPI(
              context, widget.patient.id!, searchController.text);
      setState(() {
        recommendations = resultName;
      });
    });
  }
}
