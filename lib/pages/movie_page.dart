import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Models/movie_model.dart';
import '../utils/data.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  bool isFavorite = false;

  void onFavoritePressed() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        saveFavoriteMovie(widget.movie);
      } else {
        removeFavoriteMovie(widget.movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              ..._buildBackground(context, (widget.movie), constraints),
              _buildMovieInformation(context, widget.movie),
              _topBar(context),
              _watchButton(),
            ],
          );
        },
      ),
    );
  }

  Positioned _watchButton() {
    return Positioned(
      bottom: 20,
      left: 60,
      right: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            fixedSize: const Size(double.infinity, 50),
          ),
          onPressed: onFavoritePressed,
          child: const Text(
            'Watch Now',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Positioned _topBar(BuildContext context) {
    return Positioned(
      top: 50,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.3),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashRadius: 20.0,
              splashColor: Colors.yellow,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.yellow,
                size: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.3),
            ),
            child: IconButton(
              onPressed: onFavoritePressed,
              splashRadius: 20.0,
              splashColor: Colors.yellow,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.yellow,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBackground(
    BuildContext context,
    Movie movie,
    BoxConstraints constraints,
  ) {
    final height = constraints.maxHeight;
    return [
      Container(
        height: double.infinity,
        color: const Color(0xFF1c1c27),
      ),
      Image.network(
        movie.imageUrl,
        width: double.infinity,
        height: height * 0.6,
        fit: BoxFit.fill,
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Color(0xFF1c1c27),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.7],
            ),
          ),
        ),
      ),
    ];
  }

  Positioned _buildMovieInformation(BuildContext context, Movie movie) {
    return Positioned(
      bottom: 80,
      left: 20,
      right: 20,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              movie.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '${movie.yearOfRelease} | ${movie.language.toUpperCase()} | ${double.parse(movie.rating) / 2}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: double.parse(movie.rating) / 2,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 20,
              unratedColor: Colors.white.withOpacity(0.5),
              itemPadding: const EdgeInsets.all(2.0),
              itemBuilder: (context, _) {
                return const Icon(
                  Icons.star,
                  color: Colors.yellow,
                );
              },
              onRatingUpdate: (rating) {},
            ),
            const SizedBox(height: 20),
            ExpandableText(
              movie.description,
              trim: 5,
              style: const TextStyle(
                height: 1.75,
                color: Colors.white,
              ),
              linkTextStyle: const TextStyle(
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
