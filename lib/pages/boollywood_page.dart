import 'package:flutter/material.dart';
import 'package:pikashow_clone/Widgets/app_bar.dart';
import 'package:pikashow_clone/Widgets/poster_image.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../Models/movie_model.dart';
import '../utils/data.dart';

class BoollyWoodPage extends StatefulWidget {
  const BoollyWoodPage({Key? key}) : super(key: key);

  @override
  State<BoollyWoodPage> createState() => _BoollyWoodPageState();
}

class _BoollyWoodPageState extends State<BoollyWoodPage> {
  final MyAppBar _appBar = const MyAppBar(title: 'BoollyWood');
  List<dynamic> bollywoodMovies = [];

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  Future<void> loadMovies() async {
    try {
      final tmdbWithCustomLogs = TMDB(
        ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ),
      );
      final results = await tmdbWithCustomLogs.v3.discover.getMovies(region: 'IN');
      setState(() {
        bollywoodMovies = results['results'] ?? [];
      });
    } catch (e) {
      print('Error loading movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: _appBar,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.6,
        ),
        itemCount: bollywoodMovies.length,
        itemBuilder: (context, index) {
          final movie = Movie(
            id: bollywoodMovies[index]['id'],
            title: bollywoodMovies[index]['title'] ?? '',
            imageUrl:
                'https://image.tmdb.org/t/p/w780${bollywoodMovies[index]['poster_path']}',
            description: bollywoodMovies[index]['overview'],
            rating: (bollywoodMovies[index]['vote_average'] as num?)?.toStringAsFixed(1) ?? '0.0',
            yearOfRelease: bollywoodMovies[index]['release_date'] != null
                ? DateTime.parse(bollywoodMovies[index]['release_date']).year.toString()
                : '',
            language: bollywoodMovies[index]['original_language'].toString(),
          );

          return Poster(movie: movie);
        },
      ),
    );
  }
}
