import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  const String apiUrl =
      'https://api.example.com/data'; // Replace with the API endpoint you want to fetch

  final response = await http.get(
    Uri.parse(apiUrl),
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON data
    final data = json.decode(response.body);
    // You can now work with the data, for example, display it in your Flutter UI
    print(data);
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to load data');
  }
}
