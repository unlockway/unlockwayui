import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/screens/recommendations/recommendation.dart';

Future<List<RecommendationModel>> getPatientRecommendationAPI(
    BuildContext context, String patientId) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations/patient/$patientId';

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
    print(responseBody);

    List<dynamic> patientList = json.decode(responseBody);

    List<RecommendationModel> recommendations =
        patientList.map((recommendation) {
      return RecommendationModel.fromMap(recommendation);
    }).toList();

    return recommendations;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}

Future<RecommendationModel> getRecommendationByIdAPI(
    BuildContext context, String recommendationId) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations/$recommendationId';

  //const String apiUrl = 'http://localhost:8080/dishes/get';

  final uri = Uri.parse(apiUrl);

  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);

    Map<String, dynamic> recommendationJson = json.decode(responseBody);

    RecommendationModel recommendation =
        RecommendationModel.fromMap(recommendationJson);

    return recommendation;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}

Future<List<RecommendationModel>> getPatientRecommendationByDescriptionAPI(
    BuildContext context, String patientId, String description) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations/search';

  // Construindo a URI com parâmetros de consulta
  final uri = Uri.parse(apiUrl).replace(queryParameters: {
    'patientId': patientId,
    'description': description,
  });

  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);
    print(responseBody);

    List<dynamic> patientList = json.decode(responseBody);

    List<RecommendationModel> recommendations =
        patientList.map((recommendation) {
      return RecommendationModel.fromMap(recommendation);
    }).toList();

    return recommendations;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}

Future<RecommendationModel> createInitialRecommendationAPI(
  String idPatient,
  String description,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Content-Type': 'application/json', // Define o tipo do conteúdo como JSON
    },
    body: jsonEncode({
      "idNutritionist": userData.id,
      "idPatient": idPatient,
      "description": description,
      "status": "SENT"
    }),
  );

  print(response.statusCode);
  print(response.body);

  String responseBody = utf8.decode(response.bodyBytes);
  print(responseBody);

  Map<String, dynamic> recommendation = json.decode(responseBody);

  RecommendationModel retrievedRecommendation =
      RecommendationModel.fromMap(recommendation);

  return retrievedRecommendation;
}

Future<void> deleteInitialRecommendationAPI(
  BuildContext context,
  String recommendationID,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations/$recommendationID';

  final response = await http.delete(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
    },
  );

  print(response.statusCode);
  print(response.body);

  Navigator.of(context).pop();
}

Future<void> editCreateRecommendationAPI(
  BuildContext context,
  String idRecommendation,
  String description,
  String idPatient,
  String operation,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations/$idRecommendation';

  var payload = {
    "idNutritionist": userData.id,
    "idPatient": idPatient,
    "description": description,
    "status": "SENT"
  };

  var payloadEncoded = json.encode(payload);

  final response = await http.put(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      "Content-type": "application/json",
    },
    body: payloadEncoded,
  );

  if (response.statusCode == 200) {
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: operation == "edit"
            ? "Recomendação editada com sucesso"
            : "Recomendação criada com sucesso",
      ),
    ).then(
      (value) {
        Navigator.pop(context);
      },
    );
  } else if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: operation == "edit"
            ? "Erro ao editar recomendação"
            : "Erro ao criar recomendação",
      ),
    );
  }
}

Future<void> acceptRecommendationAPI(
  BuildContext context,
  String recommendationId,
  String patientComment,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations/accept/$recommendationId';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Content-Type': 'application/json', // Define o tipo do conteúdo como JSON
    },
    body: jsonEncode({
      "patientComment": patientComment,
    }),
  );

  if (response.statusCode == 200) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Recomendação aceita com sucesso",
      ),
    ).then(
      (value) {
        Navigator.pop(context);
      },
    );
  } else if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao aceitar recomendação",
      ),
    );
  }
}

Future<void> denyRecommendationAPI(
  BuildContext context,
  String recommendationId,
  String patientComment,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/recommendations/deny/$recommendationId';

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Content-Type': 'application/json', // Define o tipo do conteúdo como JSON
    },
    body: jsonEncode({
      "patientComment": patientComment,
    }),
  );

  if (response.statusCode == 200) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Recomendação negada com sucesso",
      ),
    ).then(
      (value) {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  } else if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao negar recomendação",
      ),
    );
  }
}
