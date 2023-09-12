import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/bottom_navigator.dart';
import 'package:unlockway/screens/settings/components/profile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(darkBgdark),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Configurações".toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      color: Colors.white,
                      fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const UBottomNavigator("Settings"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(10),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ProfileSettings()],
        ),
      ),
    );
  }
}
