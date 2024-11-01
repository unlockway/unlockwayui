import 'package:flutter/material.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:intl/intl.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    super.key,
    required this.recommendation,
  });

  final RecommendationModel recommendation;

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(recommendation.status),
              Text(formatDate(recommendation.createdAt)),
            ],
          ),
          Text(recommendation.description),
        ],
      ),
    );
  }
}
