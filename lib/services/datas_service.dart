import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kosku/dto/datas.dart';
import 'package:kosku/endpoints/datas_endpoint.dart';

class DataService {
  static Future<List<Datas>> fetchDatas() async {
    final response = await http.get(Uri.parse(Endpoints.datas));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String,dynamic>;
      return (data['datas']as List<dynamic>)
      .map((item) => Datas.fromJson(item as Map<String,dynamic>))
      .toList();
    } else {
      // Handle error
      throw Exception('Failed to load Datas');
    }
  }

  // // post data to endpoint Datas
  // static Future<Datas> createDatas(String title, String body) async {
  //   final response = await http.post(
  //     Uri.parse(Endpoints.datas),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'title': title,
  //       'body': body,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     // Check for creation success (201 Created)
  //     final jsonResponse = jsonDecode(response.body);
  //     return Datas.fromJson(jsonResponse);
  //   } else {
  //     // Handle error
  //     throw Exception('Failed to create post: ${response.statusCode}');
  //   }
  // }
}
