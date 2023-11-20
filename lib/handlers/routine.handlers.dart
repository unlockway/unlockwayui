// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/data/routine.dart';
import 'package:unlockway/models/routine.dart';

Future<void> getRoutinesAPI(
  BuildContext context,
  String userID,
  String sessionToken,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/routines/userId'; // Substitua pelo seu endpoint da API

  try {
    final response = await http.get(
      Uri.parse(apiUrl).replace(queryParameters: {
        'id': userID,
      }),
      headers: {
        'Authorization': 'Bearer $sessionToken',
      },
    );

    userRoutines = json.decode(response.body);

    routine = userRoutines.map((entry) {
      Map<String, bool> weekRepetition = entry['weekRepetitions'];
      List<bool> weekRepetitionsList = weekRepetition.values.toList();

      return RoutineModel(
        entry['id'],
        entry['name'],
        entry['meals'],
        entry['inUsage'],
        weekRepetitionsList,
        entry['totalCaloriesInTheDay'],
        entry['createdAt'],
        entry['updatedAt'],
      );
    }).toList();
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
}

Future<void> createRoutineAPI(
  BuildContext context,
  String userID,
  String sessionToken,
  String routineName,
  bool inUsage,
  List<RoutineMeal> meals,
  List<bool> weekRepetitions,
) async {
  const String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/routines';

  List<Map<String, dynamic>> jsonList =
      meals.map((meal) => meal.toJson()).toList();

  var finalWeekRepetitions = {
    "monday": weekRepetitions[0],
    "tuesday": weekRepetitions[1],
    "wednesday": weekRepetitions[2],
    "thursday": weekRepetitions[3],
    "friday": weekRepetitions[4],
    "saturday": weekRepetitions[5],
    "sunday": weekRepetitions[6]
  };

  var payload = {
    "name": routineName,
    "inUsage": inUsage,
    "meals": jsonList,
    "weekRepetitions": finalWeekRepetitions,
  };

  var payloadEncoded = json.encode(payload);

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $sessionToken',
      "Content-type": "application/json"
    },
    body: payloadEncoded,
  );

  print(response.body);
  print(routine);
  if (response.statusCode == 201) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Rotina criada com sucesso",
      ),
    );
  }

  if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao criar rotina",
      ),
    );
  }
}

Future<void> editRoutineAPI(
  BuildContext context,
  String userID,
  String sessionToken,
  String routineName,
  bool inUsage,
  List<RoutineMeal> meals,
  List<bool> weekRepetitions,
) async {
  const String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/routines';

  List<Map<String, dynamic>> jsonList =
      meals.map((meal) => meal.toJson()).toList();

  var finalWeekRepetitions = {
    "monday": weekRepetitions[0],
    "tuesday": weekRepetitions[1],
    "wednesday": weekRepetitions[2],
    "thursday": weekRepetitions[3],
    "friday": weekRepetitions[4],
    "saturday": weekRepetitions[5],
    "sunday": weekRepetitions[6]
  };

  var payload = {
    "name": routineName,
    "inUsage": inUsage,
    "meals": jsonList,
    "weekRepetitions": finalWeekRepetitions,
  };

  var payloadEncoded = json.encode(payload);

  final response = await http.put(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $sessionToken',
    },
    body: payloadEncoded,
  );

  print(response.body);
  print(routine);
  if (response.statusCode == 201) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Rotina editada com sucesso",
      ),
    );
  }

  if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao editar rotina",
      ),
    );
  }
}

Future<void> deleteRoutineAPI(
  BuildContext context,
  String sessionToken,
  String routineID,
) async {
  String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/routines/$routineID';

  final response = await http.delete(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $sessionToken',
    },
  );

  response;
}
