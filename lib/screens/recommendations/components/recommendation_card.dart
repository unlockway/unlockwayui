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
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: colorScheme.onSurface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'STATUS: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.outline,
                  ),
                  children: [
                    TextSpan(
                      text: recommendation.status,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: 'DATA: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.outline,
                  ),
                  children: [
                    TextSpan(
                      text: formatDate(recommendation.createdAt),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            recommendation.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: colorScheme.surface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
