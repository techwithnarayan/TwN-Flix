import 'dart:convert';
import 'package:flix/model/data_model.dart';
import 'package:http/http.dart' as http;


class PostDetails {
  final url = "https://techwithnarayan.github.io/api/test.json";

  Future<List<Show>> apicall() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['posts'];
      return jsonData.map((json) => _parseShow(json)).toList();
    } else {
      throw Exception("Failed to fetch data from API");
    }
  }

  Show _parseShow(dynamic json) {
    List<Season> seasons = [];
    if (json['seasons'] != null) {
      for (dynamic seasonJson in json['seasons']) {
        List<Episode> episodes = [];
        if (seasonJson['episodes'] != null) {
          for (dynamic episodeJson in seasonJson['episodes']) {
            episodes.add(
              Episode(
                episodeNumber: episodeJson['episode_number'],
                episodeTitle: episodeJson['episode_title'],
                downloadLink: episodeJson['download_link'],
                playLink: episodeJson['play_link'],
              ),
            );
          }
        }
        seasons.add(
          Season(
            seasonNumber: seasonJson['season_number'],
            episodes: episodes,
          ),
        );
      }
    }

    return Show(
      category: json['Category'],
      title: json['Title'],
    released: json['Released'],
    genre: json['Genre'],
    plot: json['Plot'],
    actors: List<String>.from(json['Actors']),
    ratings: json['Ratings'],
    view: json['View'],
    download: json['Download'],
    poster: json['Poster'],
    images: List<String>.from(json['images']),
    seasons: seasons,
    );
  }
}
