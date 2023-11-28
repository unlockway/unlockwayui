// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/relations/routine_meal_on_creation.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/screens/routine/routine.dart';

Future<List<RoutineModel>> getRoutinesAPI(
  BuildContext context,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/routines/userId';

  final response = await http.get(
    Uri.parse(apiUrl).replace(queryParameters: {
      'id': userData.id,
    }),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
    },
  );

  List routineList = json.decode(response.body);

  return routineList.map((routine) {
    return RoutineModel.fromMap(routine);
  }).toList();
}

Future<void> createRoutineAPI(
  BuildContext context,
  String userID,
  String sessionToken,
  String routineName,
  bool inUsage,
  List<RoutineMealOnCreation> meals,
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

  if (response.statusCode == 201) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Rotina criada com sucesso",
      ),
    ).then(
      (value) => Navigator.push(
        context,
        navigationPageLeftAnimation(
          const Routine(),
        ),
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
  String routineName,
  bool inUsage,
  List<RoutineMealOnCreation> meals,
  List<bool> weekRepetitions,
  String routineID,
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
    "id": routineID,
    "name": routineName,
    "inUsage": inUsage,
    "meals": jsonList,
    "weekRepetitions": finalWeekRepetitions,
  };

  var payloadEncoded = json.encode(payload);

  // print(payloadEncoded);

  final response = await http.put(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      "Content-type": "application/json",
    },
    body: payloadEncoded,
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
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
      SimplePopup(
        message: "Erro ao editar rotina: ${response.body}",
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

  if (response.statusCode == 200) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Rotina excluida com sucesso",
      ),
    ).then(
      (value) => Navigator.push(
        context,
        navigationPageLeftAnimation(
          const Routine(),
        ),
      ),
    );
  }

  if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: "Erro ao excluir rotina: ${response.body}",
      ),
    );
  }
}

Future<void> changeUsedRoutine(BuildContext context, String routineId) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/routines/use';

  final response = await http.put(Uri.parse(apiUrl), headers: {
    'Authorization': 'Bearer ${userData.token}',
  }, body: {
    "user": userData.id,
    "routine": routineId,
  });
  response;
}
