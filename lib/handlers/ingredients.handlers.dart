// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/ingredients.dart';

Future<List<IngredientModel>> getIngredientsAPI(BuildContext context) async {
  var sessionToken = userData.token;
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/ingredients';

  final response = await http.get(Uri.parse(apiUrl), headers: {
    'Authorization': 'Bearer $sessionToken',
  });

  List ingredientsList = json.decode(response.body);

  return ingredientsList.map((ingredient) {
    return IngredientModel.fromMap(ingredient);
  }).toList();
}

Future<List<IngredientModel>> getIngredientsByNameAPI(
  BuildContext context,
  String name,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/ingredients/findByName';

  final response = await http.get(
    Uri.parse(apiUrl).replace(queryParameters: {
      'userId': userData.id,
      'name': name,
    }),
    headers: {
      'Authorization': 'Bearer ${userData.token}',
    },
  );

  List ingredientList = json.decode(response.body);

  return ingredientList.map((ingredient) {
    return IngredientModel.fromMap(ingredient);
  }).toList();
}
