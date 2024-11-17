import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/recommendation.dart';
import 'package:http/http.dart' as http;

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
