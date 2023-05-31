class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final String rating;
  final dynamic yearOfRelease;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.yearOfRelease,
  });

  String get yearString {
    if (yearOfRelease is int) {
      return yearOfRelease.toString();
    } else {
      return yearOfRelease;
    }
  }

  static fromJson(movieData) {}
}