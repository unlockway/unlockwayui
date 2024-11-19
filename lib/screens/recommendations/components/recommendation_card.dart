import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:intl/intl.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/recommendations/recommendation.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    super.key,
    required this.recommendation,
    required this.patient,
    required this.onTap,
  });

  final RecommendationModel recommendation;
  final UserModel patient;
  final VoidCallback onTap;

  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(
          navigationPageRightAnimation(
            Recommendation(
              recommendation: recommendation,
              patient: patient,
            ),
          ),
        )
            .then((value) {
          onTap();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: colorScheme.onSurface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
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
      ),
    );
  }
}
