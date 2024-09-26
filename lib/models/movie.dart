// // class Movie {
// //   final String title;
// //   final String imageUrl;
// //   String summary;
// //   final String url;
// //   final double rating;

// //   Movie({
// //     required this.title,
// //     required this.imageUrl,
// //     required this.summary, // Change this to be nullable
// //     required this.url,
// //     required this.rating,
// //   });

// //   factory Movie.fromJson(Map<String, dynamic> json) {
// //     return Movie(
// //       title: json['show']['name'] ?? 'Unknown Title',
// //       imageUrl: json['show']['image'] != null ? json['show']['image']['medium'] : 'https://via.placeholder.com/150',
// //       summary: json['show']['summary'] != null ? json['show']['summary'] : '',  // Safely handle missing summary
// //       url: json['show']['url'] ?? '',
// //       rating: json['show']['rating']['average'] != null ? json['show']['rating']['average'].toDouble() : 0.0,
// //     );
// //   }
// // }



// class Movie {
//   final String title;
//   final String imageUrl;
//   String summary;
//   final String url;
//   final double rating;
//   final List<String> genres;
//   final int duration;

//   Movie({
//     required this.title,
//     required this.imageUrl,
//     required this.summary,
//     required this.url,
//     required this.rating,
//     required this.genres,
//     required this.duration,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       title: json['show']['name'] ?? 'Unknown Title',
//       imageUrl: json['show']['image'] != null ? json['show']['image']['original'] : 'https://via.placeholder.com/150',
//       summary: json['show']['summary'] ?? 'No summary available.',
//       url: json['show']['url'] ?? '',
//       rating: json['show']['rating']['average'] != null ? json['show']['rating']['average'].toDouble() : 0.0,
//       genres: List<String>.from(json['show']['genres'] ?? []),
//       duration: json['show']['runtime'] ?? 0, // runtime in minutes
//     );
//   }
// }



class Movie {
  final String title;
  final String imageUrl;
  String summary;
  final String url;
  final double rating;
  final List<String> genres;
  final int duration;
  final String? trailerUrl; // Optional trailer URL
  final String? director;   // Optional director
  final List<String> cast;   // Cast as a list of names
  final String? releaseDate; // Optional release date
  final String? language;    // Optional language

  Movie({
    required this.title,
    required this.imageUrl,
    required this.summary,
    required this.url,
    required this.rating,
    required this.genres,
    required this.duration,
    this.trailerUrl,
    this.director,
    this.cast = const [],
    this.releaseDate,
    this.language,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['show']['name'] ?? 'Unknown Title',
      imageUrl: json['show']['image'] != null ? json['show']['image']['original'] : 'https://via.placeholder.com/150',
      summary: json['show']['summary'] ?? 'No summary available.',
      url: json['show']['url'] ?? '',
      rating: json['show']['rating']['average'] != null ? json['show']['rating']['average'].toDouble() : 0.0,
      genres: List<String>.from(json['show']['genres'] ?? []),
      duration: json['show']['runtime'] ?? 0,
      trailerUrl: json['show']['trailer'] ?? null,  // Assuming trailer URL is available in 'trailer'
      director: json['show']['director'] ?? 'Unknown Director',  // Assuming director is in 'director'
      cast: List<String>.from(json['show']['cast'] ?? []),  // Assuming cast is a list in 'cast'
      releaseDate: json['show']['releaseDate'],  // Assuming release date is available
      language: json['show']['language'],  // Assuming language is available
    );
  }
}
