// // ignore_for_file: public_member_api_docs, sort_constructors_first
class Show {
  final String title;
  final String released;
  final String genre;
  final String plot;
  final List<String> actors;
  final String ratings;
  final String view;
  final String download;
  final String poster;
  final String category;
  final List<String> images;
  final List<Season>? seasons;

  Show({
    required this.category,
    required this.title,
    required this.released,
    required this.genre,
    required this.plot,
    required this.actors,
    required this.ratings,
    required this.view,
    required this.download,
    required this.poster,
    required this.images,
      this.seasons,
  });
}

class Season {
  final String seasonNumber;
  final List<Episode> episodes;

  Season({
    required this.seasonNumber,
    required this.episodes,
  });
}

class Episode {
  final String episodeNumber;
  final String episodeTitle;
  final String downloadLink;
  final String playLink;

  Episode({
    required this.episodeNumber,
    required this.episodeTitle,
    required this.downloadLink,
    required this.playLink,
  });
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








//https://techwithnarayan.github.io/api/test.json











