import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/ingredients.dart';
import 'package:unlockway/models/meal_suggestion.dart';
import 'package:http/http.dart' as http;

Future<void> createMealSuggestionAPI(
  BuildContext context,
  String idRecommendation,
  String idPatient,
  String originalMealId,
  String name,
  String category,
  String description,
  String preparationMethod,
  List<SelectedFood> ingredients,
  File? imageFile,
) async {
  const String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/meal-suggestions';

  var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
    ..headers['Authorization'] = 'Bearer ${userData.token}';

  var payload = {
    "idRecommendation": idRecommendation,
    "idNutritionist": userData.id,
    "idPatient": idPatient,
    "originalMealId": originalMealId,
    "name": name,
    "category": category,
    "description": description,
    "preparationMethod": preparationMethod,
    "ingredients": ingredients.map((e) => e.toJson()).toList()
  };

  String payloadEncoded = json.encode(payload);

  request.fields["payload"] = payloadEncoded;

  if (imageFile != null) {
    var imageStream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile('photo', imageStream, length,
        filename: imageFile.path.split('/').last,
        contentType: MediaType(
          "image",
          imageFile.path.split(".").last,
        ));

    request.files.add(multipartFile);
  }

  await request.send().then(
    (response) {
      print(response.statusCode);
      if (response.statusCode == 201) {
        Navigator.pop(context);
      }

      if (response.statusCode == 400) {
        modalBuilderBottomAnimation(
          context,
          const SimplePopup(
            message: "Erro ao criar sugestão",
          ),
        );
      }
    },
  );
}

Future<List<MealSuggestion>> getMealSuggestionsByIdAPI(
    BuildContext context, String recommendationId) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/meal-suggestions/$recommendationId';

  //const String apiUrl = 'http://localhost:8080/dishes/get';

  final uri = Uri.parse(apiUrl);

  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer ${userData.token}',
      'Accept-Charset': 'UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);

    List<dynamic> mealList = json.decode(responseBody);

    List<MealSuggestion> meals = mealList.map((meal) {
      return MealSuggestion.fromMap(meal);
    }).toList();

    return meals;
  } else {
    throw Exception('Falha na solicitação: ${response.statusCode}');
  }
}
