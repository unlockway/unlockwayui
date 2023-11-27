// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  var historyList = json.decode(response.body);

  return historyList.map((history) {
    return HistoryModel.fromMap(history);
  }).toList();
}
