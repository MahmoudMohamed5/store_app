import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  /// Sends a GET request to [url] and returns the response body as a
  /// JSON-decoded map.
  ///
  /// Throws an [Exception] if the response code is not 200.
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      
      return jsonDecode(response.body) ;
     
    } else {
      throw Exception('Failed to get data: ${response.statusCode}');
    }
  }
}
