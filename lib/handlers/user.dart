import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  const String apiUrl =
      'https://api.example.com/data'; // Replace with your API endpoint

  try {
    final response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      // Parse and handle the data here
      // For example, you can decode a JSON response using the 'dart:convert' package:
      // final data = json.decode(response.body);
    } else {
      // Handle the response status code
    }
  } catch (e) {
    // Handle network errors, exceptions, or any other errors
  }
}
