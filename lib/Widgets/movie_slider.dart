// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../Models/movie_model.dart';
import '../pages/movie_page.dart';
import '../utils/data.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  List trendingMovies = [];

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending(
      mediaType: MediaType.movie,
    );
    setState(() {
      trendingMovies = trendingResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return trendingMovies.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : CarouselSlider.builder(
            options: CarouselOptions(
              height: widget.height * 0.75,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
            ),
            itemCount: trendingMovies.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(
                        movie: Movie(
                          id: trendingMovies[index]['id'],
                          title: trendingMovies[index]['title'] ?? '',
                          imageUrl:
                              'https://image.tmdb.org/t/p/w300${trendingMovies[index]['poster_path']}',
                          description: trendingMovies[index]['overview'],
                          rating:
                              (trendingMovies[index]['vote_average'] as num?)
                                      ?.toStringAsFixed(1) ??
                                  '0.0',
                          yearOfRelease:
                              trendingMovies[index]['release_date'] != null
                                  ? DateTime.parse(
                                      trendingMovies[index]['release_date'],
                                    ).year.toString()
                                  : '',
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w300${trendingMovies[index]['poster_path']}',
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
