// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unlockway/components/popups.dart';
import 'package:unlockway/components/simple_popup.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/models/user.dart';
import 'package:http_parser/http_parser.dart';

Future<void> updateUserDataHandler(
  BuildContext? context,
  String userId,
  String sessionToken,
  String firstname,
  String lastname,
  String email,
  String password,
  double height,
  double weight,
  List<String> goals,
  String biotype,
  String sex,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/patient/$userId';

  bool mMass = false;
  bool mHealth = false;
  bool lWeight = false;

  if (goals.contains('Ganhar músculo')) mMass = true;
  if (goals.contains('Manter saúde')) mHealth = true;
  if (goals.contains('Perder peso')) lWeight = true;

  var goalsObject = {
    "gainMuscularMass": mMass,
    "maintainHealth": mHealth,
    "loseWeight": lWeight,
  };

  var payload = {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "height": height,
    "weight": weight,
    "goals": goalsObject,
    "biotype": biotype,
    "sex": sex,
    "deviceToken": fcmToken
  };

  if (password.isNotEmpty) {
    payload["password"] = password;
  }

  var bodyApi = json.encode(payload);

  try {
    await http
        .put(
      Uri.parse(apiUrl),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $sessionToken"
      },
      body: bodyApi,
    )
        .then((response) {
      var user = json.decode(response.body);

      userData = UserModel.fromMap(user);

      if (context != null) {
        modalBuilderBottomAnimation(
          context,
          const SimplePopup(message: "Usuário atualizado"),
        );
      }
    });
  } catch (error) {
    if (context != null) {
      modalBuilderBottomAnimation(
        context,
        SimplePopup(
          message: error
              .toString()
              .replaceAll(
                  "FormatException: Unexpected character (at character 1)", "")
              .replaceAll("^", ""),
        ),
      );
    }
  }
}

Future<void> applyUserPhotoHandler(
  BuildContext context,
  File photo,
  String userId,
  String sessionToken,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/user/photo/$userId';

  var request = http.MultipartRequest(
    'PUT',
    Uri.parse(apiUrl),
  )..headers['Authorization'] = 'Bearer $sessionToken';

  var imageStream = http.ByteStream(photo.openRead());
  var length = await photo.length();
  var multipartFile = http.MultipartFile(
    'photo',
    imageStream,
    length,
    filename: photo.path.split('/').last,
    contentType: MediaType(
      "image",
      photo.path.split(".").last,
    ),
  );

  request.files.add(multipartFile);

  var stream = await request.send();

  if (stream.statusCode == 200) {
    var response = await http.Response.fromStream(stream);
    userData.photo = response.body;
  } else if (stream.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao aplicar foto",
      ),
    );
  }
}

Future<void> updateNutritionistDataHandler(
  BuildContext? context,
  String firstname,
  String lastname,
  String email,
  String password,
  String cfnToken,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/nutritionist/${userData.id}';

  var payload = {
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "cfn": cfnToken,
    "deviceToken": fcmToken
  };

  if (password.isNotEmpty) {
    payload["password"] = password;
  }

  var bodyApi = json.encode(payload);

  try {
    await http
        .put(
      Uri.parse(apiUrl),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer ${userData.token}"
      },
      body: bodyApi,
    )
        .then((response) {
      var user = json.decode(response.body);
      print(user);

      userData = UserModel.fromMapSimple(user);

      if (context != null) {
        modalBuilderBottomAnimation(
          context,
          const SimplePopup(message: "Usuário atualizado"),
        );
      }
    });
  } catch (error) {
    if (context != null) {
      modalBuilderBottomAnimation(
        context,
        SimplePopup(
          message: error
              .toString()
              .replaceAll(
                  "FormatException: Unexpected character (at character 1)", "")
              .replaceAll("^", ""),
        ),
      );
    }
  }
}

Future<void> applyNutritionistPhotoHandler(
  BuildContext context,
  File photo,
  String userId,
  String sessionToken,
) async {
  String apiUrl =
      'https://unlockwayapi.azurewebsites.net/api/v2/nutritionist/photo/$userId';

  var request = http.MultipartRequest(
    'PUT',
    Uri.parse(apiUrl),
  )..headers['Authorization'] = 'Bearer ${userData.token}';

  var imageStream = http.ByteStream(photo.openRead());
  var length = await photo.length();
  var multipartFile = http.MultipartFile(
    'photo',
    imageStream,
    length,
    filename: photo.path.split('/').last,
    contentType: MediaType(
      "image",
      photo.path.split(".").last,
    ),
  );

  request.files.add(multipartFile);

  var stream = await request.send();

  if (stream.statusCode == 200) {
    var response = await http.Response.fromStream(stream);
    userData.photo = response.body;
  } else if (stream.statusCode == 400) {
    modalBuilderBottomAnimation(
      context,
      const SimplePopup(
        message: "Erro ao aplicar foto",
      ),
    );
  }
}
