import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/constants.dart';

class RoutineMealCard extends StatelessWidget {
  const RoutineMealCard({
    super.key,
    required this.category,
    required this.meal,
    required this.hour,
  });

  final String category;
  final String meal;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(darkBglight),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/svgs/forkKnife.svg",
                width: 26,
                height: 26,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                category,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 19.2,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PhosphorIcon(
                PhosphorIcons.regular.bowlFood,
                color: Color(success),
                size: 26,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                meal,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 19.2,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/svgs/Timer.svg",
                width: 26,
                height: 26,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                hour,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Inter",
                  fontSize: 19.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
