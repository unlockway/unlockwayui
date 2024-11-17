// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/home_data.dart';

Future<HomeDataModel> getHomeAnalysysAPI(BuildContext context) async {
  String baseUrl = 'https://unlockwayapi.azurewebsites.net/api/v2/analysis';

  // Cria o Uri com o id como um parâmetro
  Uri apiUri = Uri.parse(baseUrl).replace(
    queryParameters: {'patientId': userData.id},
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
