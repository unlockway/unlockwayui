import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/home/components/client_info_card.dart';
import 'package:unlockway/screens/home/components/weekly_bar_chart.dart';

class ClientInfo extends StatelessWidget {
  final UserModel user;

  const ClientInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClientInfoCard(user: user),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonFilled(
                  text: "Rotinas", height: 120, width: 120, onTap: () {}),
              ButtonFilled(
                  text: "Refeições", height: 120, width: 120, onTap: () {}),
            ],
          ),
          const SizedBox(height: 30),
          const WeeklyBarChart(weeklyValues: [10, 20, 30, 4000, 50, 60, 7000]),
        ],
      ),
    );
  }
}
