import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/notify.dart';
import 'package:http/http.dart' as http;

Future<List<NotifyModel>> getNotifyAPI(
  BuildContext context,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/meals/findByUserId';

  final response = await http.get(
    Uri.parse(apiUrl).replace(queryParameters: {
      'id': userData.id,
    }),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
    },
  );

  List notifyList = json.decode(response.body);

  return notifyList.map((notify) {
    return NotifyModel.fromMap(notify);
  }).toList();
}
