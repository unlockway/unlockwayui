// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/home_data.dart';

Future<HomeDataModel> getHomeAnalysysAPI(BuildContext context) async {
  const String apiUrl =
      'https://unlockwayappservice-dxfzdga6d0h7e8f3.brazilsouth-01.azurewebsites.net/api/v2/home/homeData';

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> responseData = json.decode(responseBody)['data'];

    return HomeDataModel.fromMap(responseData);
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}
