import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/routine/components/routine_meal_edit_popup.dart';

class RoutineMealCard extends StatelessWidget {
  const RoutineMealCard({
    super.key,
    required this.category,
    required this.meal,
    required this.hour,
    required this.calories,
    required this.imgURL,
  });

  final int category;
  final String meal;
  final String hour;
  final double calories;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => modalBuilderBottomAnimation(
        context,
        const EditMealRoutinePopup(),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
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
                  category.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontFamily: "Inter",
                    fontSize: 19.2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
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
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontFamily: "Inter",
                    fontSize: 19.2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
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
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontFamily: "Inter",
                    fontSize: 19.2,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset("assets/svgs/Fire.svg"),
                    Text(
                      calories.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE96016),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
