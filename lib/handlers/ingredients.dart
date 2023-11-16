// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';

Future<void> getIngredientsAPI(
  BuildContext context,
  String sessionToken,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/ingredients';

  try {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Authorization': 'Bearer $sessionToken',
      "Content-type": "application/json",
    });

    ingredients = json.decode(utf8.decode(response.bodyBytes));
  } catch (e) {
    if (e is http.ClientException) {
      // Handle network-related errors
    } else {
      // Handle other errors
    }

    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
  // Handle other errors
}

Future<void> getIngredientsByNameAPI(
  BuildContext context,
  String sessionToken,
  String name,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/ingredients';

  try {
    final response = await http.get(
      Uri.parse(apiUrl).replace(queryParameters: {
        'name': name,
      }),
      headers: {
        'Authorization': 'Bearer $sessionToken',
        "Content-type": "application/json",
      },
    );

    ingredients = json.decode(utf8.decode(response.bodyBytes));
  } catch (e) {
    if (e is http.ClientException) {
      // Handle network-related errors
    } else {
      // Handle other errors
    }

    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Houve um erro na execução do aplicativo",
      ),
    );
  }
  // Handle other errors
}