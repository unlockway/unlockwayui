// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/ingredients.dart';

Future<List<IngredientModel>> getIngredientsAPI(
  BuildContext context,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/ingredients';

  final response = await http.get(Uri.parse(apiUrl), headers: {
    'Authorization': 'Bearer ${userData.token}',
    "Content-type": "application/json",
  });

  List ingredients = json.decode(response.body);

  try {
    return ingredients.map((e) => IngredientModel.fromMap(e)).toList();
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao buscar os ingredientes",
      ),
    );
  }

  return [];
}

Future getIngredientsByNameAPI(
  BuildContext context,
  String name,
) async {
  const String apiUrl =
      'https://unlockway.azurewebsites.net/api/v1/ingredients/findByName';

  try {
    final response = await http.get(
      Uri.parse(apiUrl).replace(queryParameters: {
        'name': name,
      }),
      headers: {
        'Authorization': 'Bearer ${userData.token}',
        "Content-type": "application/json",
      },
    );

    List ingredientList = json.decode(response.body);

    return ingredientList.map((e) => IngredientModel.fromMap(e)).toList();
  } catch (e) {
    modalBuilderBottomAnimation(
      context,
      SimplePopup(
        message: "Erro ao buscar por $name",
      ),
    );
  }
}
