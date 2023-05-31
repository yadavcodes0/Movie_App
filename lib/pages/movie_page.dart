// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../Models/movie_model.dart';
import '../utils/data.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          child: Image.network(
            widget.movie.imageUrl,
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height,
            width: width,
            color: const Color.fromARGB(255, 16, 17, 25).withOpacity(0.7),
          ),
        ),
        ForeGround(
          movie: widget.movie,
          isFavorite: _isFavorite,
          onFavoritePressed: () {
            setState(() {
              _isFavorite = !_isFavorite;
              if (_isFavorite) {
                saveFavoriteMovie(widget.movie);
              } else {
                removeFavoriteMovie(widget.movie);
              }
            });
          },
        ),
      ],
    );
  }
}

class ForeGround extends StatelessWidget {
  const ForeGround({
    Key? key,
    required this.movie,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);
  final Movie movie;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: onFavoritePressed,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 30),
                  const SizedBox(width: 5),
                  Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      movie.yearOfRelease.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                movie.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    'Watch Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
