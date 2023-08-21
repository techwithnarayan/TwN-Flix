// ignore_for_file: public_member_api_docs, sort_constructors_first

class Posts {
  String title;
  String released;
  String genre;
  String plot;
  String language;
  String ratings;
  String poster;
  String view;
  String download;
  String actors;
  String category;
  List<String> images;
  Posts({
    required this.title,
    required this.released,
    required this.genre,
    required this.plot,
    required this.language,
    required this.ratings,
    required this.poster,
    required this.view,
    required this.download,
    required this.actors,
    required this.category,
    required this.images,
  });

  factory Posts.fromjson(Map<String, dynamic> json) {
    return Posts(
      title: json['Title'],
      released: json['Released'],
      genre: json['Genre'],
      plot: json['Plot'],
      language: json['Language'],
      ratings: json['Ratings'],
      poster: json['Poster'],
      view: json['View'],
      download: json['Download'],
      actors: json['Actors'],
      category: json['Category'],
      images: List<String>.from(json['images']),
    );
  }
}
