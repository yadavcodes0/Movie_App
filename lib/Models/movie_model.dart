class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final String rating;
  final dynamic yearOfRelease;
  final String language;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.yearOfRelease,
    required this.language,
  });


  static fromJson(movieData) {}
}