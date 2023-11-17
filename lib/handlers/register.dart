// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/login/components/about.dart';

Future<void> registerAPI(
  BuildContext context,
  String firstname,
  String lastname,
  String email,
  String password,
  double height,
  double weight,
  List<String> goals,
  String biotype,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/auth/register';

  bool mMass = false;
  bool mHealth = false;
  bool lWeight = false;

  if (goals.contains('Ganhar músculo')) {
    mMass = true;
  } else if (goals.contains('Manter saúde')) {
    mHealth = true;
  } else if (goals.contains('Perder peso')) {
    lWeight = true;
  }

  var goalsObject = {
    "gainMuscularMass": mMass,
    "maintainHealth": mHealth,
    "loseWeight": lWeight,
  };

  var payload = {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "password": password,
    "height": height,
    "weight": weight,
    "goals": goalsObject,
    "biotype": biotype,
  };

  var bodyApi = json.encode(payload);

  try {
    await http
        .post(
      Uri.parse(apiUrl),
      headers: {"Content-type": "application/json"},
      body: bodyApi,
    )
        .then((response) {
      var user = json.decode(response.body);

      userData = UserModel.fromMap(user);

      navigatePage(
        context,
        const AboutPage(),
      );
    });
  } catch (error) {
    print(error.toString());
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: error
            .toString()
            .replaceAll(
                "FormatException: Unexpected character (at character 1)", "")
            .replaceAll("^", ""),
      ),
    );
  }
}
