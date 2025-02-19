// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/home_data.dart';
import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/patient.dart';
import 'package:unlockway/models/routine.dart';
import 'package:unlockway/models/user.dart';

Future<List<PatientUserModel>> getPatientsAPI(BuildContext context) async {
  String apiUrl = '${apiKey}nutritionist/${userData.id}/patients';

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

    List<PatientUserModel> meals = patientList.map((patient) {
      return PatientUserModel.fromMap(patient);
    }).toList();

    return meals;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}

Future<List<PatientUserModel>> getPatientsByNameAPI(
  BuildContext context,
  String name,
) async {
  String baseUrl = 'unlockwayapi.azurewebsites.net';
  String path = '/api/v2/nutritionist/${userData.id}/patients/findByName';

  // Cria a URI com o parâmetro de consulta "name"
  final uri = Uri.https(baseUrl, path, {'name': name});

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

    List<PatientUserModel> patients = patientList.map((patient) {
      return PatientUserModel.fromMap(patient);
    }).toList();

    return patients;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}

Future<List<MealsModel>> getPatientMealsAPI(
  BuildContext context,
  String patientId,
) async {
  String apiUrl = '${apiKey}meals/findByPatientId';

  final uri =
      Uri.parse(apiUrl).replace(queryParameters: {'patientId': patientId});

  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);

    List<dynamic> mealList = json.decode(responseBody);

    List<MealsModel> meals = mealList.map((meal) {
      return MealsModel.fromMap(meal);
    }).toList();

    return meals;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}

Future<List<RoutineModel>> getPatientRoutinesAPI(
    BuildContext context, UserModel patient) async {
  String apiUrl = '${apiKey}routines/patientId';

  final uri = Uri.parse(apiUrl).replace(queryParameters: {
    'id': patient.id,
  });

  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8', // Adicionado Accept-Charset
    },
  );

  if (response.statusCode == 200) {
    // Use o utf8.decode para garantir que a codificação seja interpretada corretamente
    String responseBody = utf8.decode(response.bodyBytes);

    // Agora, você pode decodificar o JSON
    List<dynamic> routineList = json.decode(responseBody);

    // Mapeia os dados para a lista de objetos RoutineModel
    List<RoutineModel> routines = routineList.map((routine) {
      return RoutineModel.fromMap(routine);
    }).toList();

    return routines;
  } else {
    // Se a solicitação não foi bem-sucedida, trate o erro (por exemplo, lançar uma exceção)
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}

Future<HomeDataModel> getPatientHomeAnalysysAPI(
    BuildContext context, String patientId) async {
  String baseUrl = '${apiKey}analysis';

  // Cria o Uri com o id como um parâmetro
  Uri apiUri = Uri.parse(baseUrl).replace(
    queryParameters: {'patientId': patientId},
  );

  final response = await http.get(
    apiUri,
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);

    Map<String, dynamic> responseData = json.decode(responseBody);

    return HomeDataModel.fromMap(responseData);
  } else {
    throw Exception(
      'Falha na solicitação: ${response.statusCode}, ${userData.id}, ${userData.token}',
    );
  }
}

Future<void> deletePatientAPI(
    BuildContext context, String patientRelationId) async {
  String apiUrl = '${apiKey}nutritionist/remove-patient/$patientRelationId';

  final response = await http.delete(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
    },
  );

  if (response.statusCode == 200) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Paciente desvinculado com sucesso",
      ),
    );
  }

  if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao desvincular paciente",
      ),
    );
  }
}

Future<void> linkNewPatientAPI(
  BuildContext context,
  String email,
) async {
  String apiUrl = '${apiKey}nutritionist/${userData.id}/new-patient';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Content-Type': 'application/json', // Define o tipo do conteúdo como JSON
    },
    body: jsonEncode({
      'email': email, // Payload com o email
    }),
  );

  if (response.statusCode == 200) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Paciente vinculado com sucesso",
      ),
    );
  } else {
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: response.body,
      ),
    );
  }
}
