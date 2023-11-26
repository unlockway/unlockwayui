// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/ingredients.dart';

Future<List<IngredientModel>> getIngredientsAPI(BuildContext context) async {
  var sessionToken = userData.token;
  const String apiUrl = 'https://unlockway.azurewebsites.net/api/v1/analysis';

  final response = await http.get(Uri.parse(apiUrl), headers: {
    'Authorization': 'Bearer $sessionToken',
  });

  List ingredientsList = json.decode(response.body);

  return ingredientsList.map((ingredient) {
    return IngredientModel.fromMap(ingredient);
  }).toList();
}
