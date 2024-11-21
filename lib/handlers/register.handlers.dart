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
  String sex,
  String cfnToken,
) async {
  String apiUrl = cfnToken != ""
      ? "https://unlockwayapi.azurewebsites.net/api/v2/auth/register-nutritionist"
      : "https://unlockwayapi.azurewebsites.net/api/v2/auth/register-patient";

  print(apiUrl);

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

  print("CFN:" + cfnToken);
  print("height:" + height.toString());
  print("weight:" + weight.toString());
  print("goals:" + goalsObject.toString());
  print("biotype:" + biotype);
  print("firstname:" + firstname);
  print("lastname:" + lastname);
  print("email:" + email);
  print("password:" + password);
  print("sex" + sex);
  print("deviceToken" + fcmToken!);

  var payload = cfnToken.isEmpty
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

  print(bodyApi);
  try {
    await http
        .post(
      Uri.parse(apiUrl),
      headers: {"Content-type": "application/json"},
      body: bodyApi,
    )
        .then((response) {
      print(response.statusCode);
      print(response.body);
      // Decode response body
      var decodedResponse = json.decode(utf8.decode(response.bodyBytes));

      if (decodedResponse is Map) {
        // Resposta esperada como Map
        userData = UserModel.fromMap(decodedResponse);
        navigatePage(
          context,
          const AboutPage(),
        );
      } else if (decodedResponse is List) {
        // Lidar com resposta como List
        print("Resposta da API é uma lista: $decodedResponse");
        modalBuilderBottomAnimation(
          context,
          SimplePopup(message: "Erro inesperado: resposta da API é uma lista."),
        );
      } else {
        // Tipo de resposta não esperado
        throw Exception("Formato de resposta desconhecido");
      }
    });
  } catch (error) {
    print(error);

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
