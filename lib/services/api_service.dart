import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";
  //pub.dev 에서 dart, flutter 공식 패키지
  //웹서비스를 위해서 http
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
