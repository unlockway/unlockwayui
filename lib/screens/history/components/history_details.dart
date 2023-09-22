import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/days_list.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/screens/history/components/meal_history_card.dart';
import 'package:unlockway/screens/history/history.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({
    super.key,
    required this.ingestedMeals,
    required this.days,
    required this.name,
    required this.color,
    required this.calories,
  });

  final List<Object> ingestedMeals;
  final List<bool> days;
  final String name;
  final Color color;
  final double? calories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      appBar: AppBar(
        flexibleSpace: Container(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 0.0,
            right: 16.0,
            top: 16.0,
          ),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          navigationPageLeftAnimation(
                            const History(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 26.0,
                        color: Color(primarydark),
                      ),
                      label: Text(
                        'VOLTAR',
                        style: TextStyle(
                          color: Color(primarydark),
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/logo_mini.svg",
                width: 28,
                height: 28,
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(darkBgdark),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(darkBgdark),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Dias de Uso",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        DaysList(days: days, func: () {}),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Calorias Acumuladas",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                color: Colors.white,
                              ),
                            ),
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
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const MealHistoryCard(
                    svg: "assets/svgs/ok.svg",
                    title: "Filé de Frango",
                    description:
                        "Descrição detalhada do alimento aqui. Ao clicar no alimento é possivel saber mais sobre ele",
                    img: "assets/imgs/meal.png",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
