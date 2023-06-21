import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.description,
    required this.progressporcentage,
    required this.progressvalue,
    required this.goal,
  });

  final String description;
  final String progressporcentage;
  final double progressvalue;
  final String goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(darkBglight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12),
            child: CircularPercentIndicator(
              radius: 55.0,
              lineWidth: 10.0,
              backgroundColor: const Color(0xFF242E39),
              animation: true,
              percent: progressvalue,
              center: Text(
                progressporcentage,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              progressColor: const Color(0xFF74BE96),
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          Container(
            width: 275,
            margin: const EdgeInsets.only(top: 5, bottom: 15, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  goal,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "Signika",
                    fontSize: 19,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
