// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/routine.dart';

Future<void> getRoutinesAPI(
  BuildContext context,
  String userID,
  String sessionToken,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/routines/userId'; // Substitua pelo seu endpoint da API

  try {
    var bodyApi = json.encode(userID);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $sessionToken',
        "Content-type": "application/json"
      },
      body: bodyApi,
    );

    userRoutines = json.decode(response.body);
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
}
