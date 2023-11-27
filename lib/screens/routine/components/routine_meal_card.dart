import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/screens/routine/components/routine_meal_popup.dart';

class RoutineMealCard extends StatelessWidget {
  const RoutineMealCard({
    super.key,
    required this.category,
    required this.meal,
    required this.hour,
    required this.calories,
    required this.imgURL,
    required this.removeMethod,
    required this.editMethod,
    required this.mealsList,
  });

  final String category;
  final String meal;
  final String hour;
  final double calories;
  final String? imgURL;
  final Function? removeMethod;
  final Function? editMethod;
  final List<MealsModel> mealsList;

  @override
  Widget build(BuildContext context) {
    String categoryText = "";

    if (category == "LUNCH") {
      categoryText = "Almoço";
    }
    if (category == "BREAKFAST") {
      categoryText = "Café da manhã";
    }
    if (category == "DINNER") {
      categoryText = "Jantar";
    }

    if (category == "SNACK") {
      categoryText = "Lanche";
    }
    return InkWell(
      onTap: () => modalBuilderBottomAnimation(
        context,
        RoutineMealPopup(
          editMethod: editMethod,
          saveMethod: null,
          removeMethod: removeMethod,
          mealsList: mealsList,
        ),
      ),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 111,
              height: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onBackground,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: imgURL == null || imgURL == ""
                    ? Container(
                        color: Theme.of(context).colorScheme.background,
                        width: 111,
                        height: 145,
                      )
                    : CachedNetworkImage(
                        imageUrl: imgURL!,
                        fit: BoxFit.fitHeight,
                        width: 111,
                        height: 145,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Expanded(
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
                        categoryText,
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
                        PhosphorIcons.bowlFood(PhosphorIconsStyle.regular),
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
                        overflow: TextOverflow.ellipsis,
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
          ],
        ),
      ),
    );
  }
}
