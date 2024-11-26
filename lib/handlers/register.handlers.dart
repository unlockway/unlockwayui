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
import 'package:unlockway/screens/home/nutri_home.dart';
import 'package:unlockway/screens/login/components/about.dart';

Future<void> registerAPI(
  BuildContext context,
  String? firstname,
  String? lastname,
  String? email,
  String? password,
  double? height,
  double? weight,
  List<String>? goals,
  String? biotype,
  String? sex,
  String? cfnToken,
) async {
  String apiUrl = cfnToken == "" || cfnToken == null
      ? "https://unlockwayapi.azurewebsites.net/api/v2/auth/register-patient"
      : "https://unlockwayapi.azurewebsites.net/api/v2/auth/register-nutritionist";

  bool mMass = false;
  bool mHealth = false;
  bool lWeight = false;

  if (goals != null && goals.contains('Ganhar músculo')) {
    mMass = true;
  } else if (goals != null && goals.contains('Manter saúde')) {
    mHealth = true;
  } else if (goals != null && goals.contains('Perder peso')) {
    lWeight = true;
  }

  var goalsObject = {
    "gainMuscularMass": mMass,
    "maintainHealth": mHealth,
    "loseWeight": lWeight,
  };

  var payload = cfnToken == null
      ? {
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "password": password,
          "height": height,
          "weight": weight,
          "goals": goalsObject,
          "biotype": biotype,
          "sex": sex,
          "deviceToken": fcmToken,
        }
      : {
          "firstname": firstname,
          "lastname": lastname,
          "photo": "",
          "email": email,
          "password": password,
          "cfn": cfnToken,
          "deviceToken": fcmToken,
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
      // Decode response body
      var decodedResponse = json.decode(utf8.decode(response.bodyBytes));

      cfnToken == null
          ? userData = UserModel.fromMap(decodedResponse)
          : userData = UserModel.fromMapSimple(decodedResponse);
      cfnToken == null
          ? navigatePage(
              context,
              const AboutPage(),
            )
          : navigatePage(
              context,
              const NutriHome(),
            );
    });
  } catch (error) {
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
