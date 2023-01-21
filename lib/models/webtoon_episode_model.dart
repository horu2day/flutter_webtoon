class WebtoonEpisodeModel {
  final String id, title, rating, data;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        data = json['date'];
}
