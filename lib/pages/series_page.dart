import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../Models/movie_model.dart';
import '../Widgets/poster_image.dart';
import '../utils/data.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  List tvShows = [];

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
    Map resultsH = await tmdbWithCustomLogs.v3.discover.getTvShows();
    setState(() {
      tvShows = resultsH['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.yellow),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Series",
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.6,
        ),
        itemCount: tvShows.length,
        itemBuilder: (context, index) {
          return Poster(
            movie: Movie(
              id: tvShows[index]['id'],
              title: tvShows[index]['title'] ?? '',
              imageUrl:
                  'https://image.tmdb.org/t/p/w500${tvShows[index]['poster_path']}',
              description: tvShows[index]['overview'],
              rating: (tvShows[index]['vote_average'] as num?)
                      ?.toStringAsFixed(1) ??
                  '0.0',
              yearOfRelease: tvShows[index]['release_date'] != null
                  ? DateTime.parse(
                      tvShows[index]['release_date'],
                    ).year.toString()
                  : '',
            ),
          );
        },
      ),
    );
  }
}
