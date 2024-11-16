import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/notify.dart';
import 'package:http/http.dart' as http;

Future<List<NotifyModel>> getNotifyAPI(
  BuildContext context,
) async {
  const String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/notifications/findByPatientId';

  // const String apiUrl = 'http://localhost:8080/notify/get';

  final response = await http.get(
    Uri.parse(apiUrl).replace(queryParameters: {
      'id': userData.id,
    }),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);

    List notifyList = json.decode(responseBody);

    List<NotifyModel> notify = notifyList.map((notify) {
      return NotifyModel.fromMap(notify);
    }).toList();

    return notify;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}
