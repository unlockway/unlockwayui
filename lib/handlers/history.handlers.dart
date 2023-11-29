// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/history.dart';

Future<List<HistoryModel>> getHistoryAPI(BuildContext context) async {
  var sessionToken = userData.token;
  String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/history/${userData.id}';

  final response = await http.get(Uri.parse(apiUrl), headers: {
    'Authorization': 'Bearer $sessionToken',
  });

  // print(response.body);
  // print(response.statusCode);
  List historyList = json.decode(response.body);

  return historyList.map((history) {
    return HistoryModel.fromMap(history);
  }).toList();
}

Future getHistoryIngestedAPI(
  BuildContext context,
  String routineId,
  String ingestedMealId,
) async {
  String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/history/ingested';

  final response = await http.put(
    Uri.parse(apiUrl).replace(queryParameters: {
      'routine': routineId,
      'meal': ingestedMealId,
    }),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
    },
  );

  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: response.body,
      ),
    );
  }
  if (response.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Ocorreu um erro",
      ),
    );
  }
}
