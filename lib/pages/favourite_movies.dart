import 'package:flutter/material.dart';
import 'package:pikashow_clone/utils/data.dart';

import '../Widgets/app_bar.dart';
import 'movie_page.dart';

class FavouriteMovies extends StatefulWidget {
  const FavouriteMovies({super.key});

  @override
  State<FavouriteMovies> createState() => _FavouriteMoviesState();
}

class _FavouriteMoviesState extends State<FavouriteMovies> {
  final MyAppBar _appBar = const MyAppBar(title: 'Favourite Movies');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: _appBar,
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: ListTile(
                title: Text(
                  favoriteMovies[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                subtitle: Text(
                  favoriteMovies[index].yearOfRelease,
                  style: const TextStyle(color: Colors.grey),
                ),
                leading: Image.network(
                  favoriteMovies[index].imageUrl,
                ),
                trailing: IconButton(
                  onPressed: () {
                    favoriteMovies.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(Icons.delete_outline, color: Colors.yellow),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(
                        movie: favoriteMovies[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
