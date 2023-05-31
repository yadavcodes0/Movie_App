
import '../Models/movie_model.dart';

const String apikey = '17489671240e5bd9423d6c7c7a8566d0';

const readaccesstoken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNzQ4OTY3MTI0MGU1YmQ5NDIzZDZjN2M3YTg1NjZkMCIsInN1YiI6IjY0NzVkY2UyOTYzODY0MDBjMWYzZjIxYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-JKf3kHxgWMzk2NmNt9Gb0g41Tyb_5p7Tcxgc5pi44o';

final List favoriteMovies = [];

void saveFavoriteMovie(Movie movie) {
  favoriteMovies.add(movie);
}

void removeFavoriteMovie(Movie movie) {
  favoriteMovies.remove(movie);
}
