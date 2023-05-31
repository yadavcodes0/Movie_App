import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../Models/movie_model.dart';
import '../Widgets/app_bar.dart';
import '../Widgets/poster_image.dart';
import '../utils/data.dart';

class HollyWoodPage extends StatefulWidget {
  const HollyWoodPage({super.key});

  @override
  State<HollyWoodPage> createState() => _HollyWoodPageState();
}

class _HollyWoodPageState extends State<HollyWoodPage> {
  final MyAppBar _appBar = const MyAppBar(title: 'HollyWood');
  List hollywoodMovies = [];

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
    Map resultsH = await tmdbWithCustomLogs.v3.discover.getMovies(
      page: 5,
    );
    setState(() {
      hollywoodMovies = resultsH['results'];
    });
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
        itemCount: hollywoodMovies.length,
        itemBuilder: (context, index) {
          return Poster(
            movie: Movie(
              id: hollywoodMovies[index]['id'],
              title: hollywoodMovies[index]['title'] ?? '',
              imageUrl:
                  'https://image.tmdb.org/t/p/w300${hollywoodMovies[index]['poster_path']}',
              description: hollywoodMovies[index]['overview'],
              rating: (hollywoodMovies[index]['vote_average'] as num?)
                      ?.toStringAsFixed(1) ??
                  '0.0',
              yearOfRelease: hollywoodMovies[index]['release_date'] != null
                  ? DateTime.parse(
                      hollywoodMovies[index]['release_date'],
                    ).year.toString()
                  : '',
            ),
          );
        },
      ),
    );
  }
}
