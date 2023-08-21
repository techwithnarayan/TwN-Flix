import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flix/model/data_model.dart';

class PostDetails {
  final url = "https://techwithnarayan.github.io/api/posters.json";
  Future<List<Posts>> apicall() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['posts'];
      return jsonData.map((json) => Posts.fromjson(json)).toList();
    } else {
      throw Exception("failed to fetch data from api");
    }
  }
}
