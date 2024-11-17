// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/user.dart';
import 'package:unlockway/screens/meals/meals.dart';

Future<List<UserModel>> getPatientsAPI(BuildContext context) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/nutritionist/${userData.id}/patients';

  //const String apiUrl = 'http://localhost:8080/dishes/get';

  final uri = Uri.parse(
      apiUrl); //.replace(queryParameters: {'patientId': userData.id});

  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);

    List<dynamic> patientList = json.decode(responseBody);

    List<UserModel> meals = patientList.map((patient) {
      return UserModel.fromMap(patient);
    }).toList();

    return meals;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}
