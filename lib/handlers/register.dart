// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';

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

  try {
    bool mMass = false;
    bool mHealth = false;
    bool lWeight = false;

    if (goals.contains('Ganhar musculo')) {
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

    if (biotype == "Ectomorfo") {
      biotype = "ECTOMORPH";
    } else if (biotype == "Endomorfo") {
      biotype = "ENDOMORPH";
    } else if (biotype == "Mesomorfo") {
      biotype = "MESOMORPH";
    }

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

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-type": "application/json"},
      body: bodyApi,
    );

    response;

    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Usuário criado com sucesso",
      ),
    ).then(
      (value) async {
        const String apiUrl =
            'https://unlockway.azurewebsites.net/api/v1/auth/authenticate';

        Map payload = {
          "email": email,
          "password": password,
        };

        var body = json.encode(payload);

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {"Content-type": "application/json"},
          body: body,
        );

        userData = json.decode(response.body);

        navigatePage(
          context,
          const AboutPage(),
        );
      },
    );
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
}
