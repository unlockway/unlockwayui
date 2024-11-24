import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:unlockway/screens/notify/components/recommendation_details.dart';

class RecommendationNotifyCard extends StatefulWidget {
  const RecommendationNotifyCard({
    super.key,
    required this.recommendation,
    required this.setStateFunc,
  });

  final RecommendationModel recommendation;
  final VoidCallback setStateFunc;

  @override
  State<RecommendationNotifyCard> createState() =>
      _RecommendationNotifyCardState();
}

class _RecommendationNotifyCardState extends State<RecommendationNotifyCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          navigationPageRightAnimation(
            RecommendationDetails(
              recommendation: widget.recommendation,
            ),
          ),
        ).then(
          (onValue) {
            widget.setStateFunc();
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          margin: const EdgeInsets.only(bottom: 1),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  "assets/svgs/logo_mini.svg",
                  width: 28,
                  height: 28,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  widget.recommendation.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontFamily: "Inter",
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.recommendation.createdAt.toString().split(" ")[0],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontFamily: "Inter",
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
