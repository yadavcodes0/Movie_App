
import '../Models/movie_model.dart';

const String apikey = 'Add your api key here';

const readaccesstoken =
    'Add your readaccesstoken here';

final List favoriteMovies = [];

void saveFavoriteMovie(Movie movie) {
  favoriteMovies.add(movie);
}

void removeFavoriteMovie(Movie movie) {
  favoriteMovies.remove(movie);
}
