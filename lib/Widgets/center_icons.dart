import 'package:flutter/material.dart';

import '../pages/Test_Page.dart';
import '../pages/favourite_movies.dart';

class CenterIcons extends StatefulWidget {
  const CenterIcons({Key? key}) : super(key: key);

  @override
  State<CenterIcons> createState() => _CenterIconsState();
}

class _CenterIconsState extends State<CenterIcons> {
  final String telegramUrl = 'https://telegram.org/';
  final String youtubeUrl = 'https://www.youtube.com/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage('assets/icons/telegram.png'),
                  width: 52,
                  height: 52,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage('assets/icons/youtube.png'),
                  width: 52,
                  height: 52,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestPage(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/icons/Q&A.png'),
                  width: 52,
                  height: 52,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestPage(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/icons/information.png'),
                  width: 52,
                  height: 52,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestPage(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/icons/share.png'),
                  width: 52,
                  height: 52,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestPage(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/icons/world.png'),
                  width: 52,
                  height: 52,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestPage(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/icons/smile.jpg'),
                  width: 52,
                  height: 52,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavouriteMovies(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/icons/time.png'),
                  width: 52,
                  height: 52,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
