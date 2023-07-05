import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../Models/movie_model.dart';
import '../Widgets/app_bar.dart';
import '../Widgets/poster_image.dart';
import '../utils/data.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  final MyAppBar _appBar = const MyAppBar(title: 'Series');
  List<dynamic> tvShows = [];

  @override
  void initState() {
    loadTvShows();
    super.initState();
  }

  Future<void> loadTvShows() async {
    try {
      final tmdbWithCustomLogs = TMDB(
        ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ),
      );
      final results = await tmdbWithCustomLogs.v3.discover
          .getTvShows(page: 1, language: 'HI');
      setState(() {
        tvShows = results['results'] ?? [];
      });
    } catch (e) {
      print('Error loading TV shows: $e');
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
        itemCount: tvShows.length,
        itemBuilder: (context, index) {
          final tvShow = Movie(
            id: tvShows[index]['id'],
            title: tvShows[index]['title'] ?? '',
            imageUrl:
                'https://image.tmdb.org/t/p/w500${tvShows[index]['poster_path']}',
            description: tvShows[index]['overview'],
            rating:
                (tvShows[index]['vote_average'] as num?)?.toStringAsFixed(1) ??
                    '0.0',
            yearOfRelease: tvShows[index]['release_date'] != null
                ? DateTime.parse(tvShows[index]['release_date']).year.toString()
                : '',
            language: tvShows[index]['original_language'].toString(),
          );

          return Poster(movie: tvShow);
        },
      ),
    );
  }
}
