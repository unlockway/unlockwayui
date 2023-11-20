// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';

Future<void> updateUserDataHandler(
  BuildContext context,
  String userId,
  String sessionToken,
  String firstname,
  String lastname,
  String email,
  String password,
  double height,
  double weight,
  List<String> goals,
  String biotype,
  String sex,
) async {
  String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/user/$userId';

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
    "sex": sex,
  };

  var bodyApi = json.encode(payload);

  try {
    await http
        .put(
      Uri.parse(apiUrl),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $sessionToken"
      },
      body: bodyApi,
    )
        .then((response) {
      var user = json.decode(response.body);

      userData = UserModel.fromMap(user);

      modalBuilderBottomAnimation(
        context,
        const SimplePopup(message: "Usuário atualizado"),
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
