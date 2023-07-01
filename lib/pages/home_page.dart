import 'package:flutter/material.dart';
import 'package:pikashow_clone/Widgets/bottom_app_bar.dart';

import '../Widgets/center_icons.dart';
import '../Widgets/movie_slider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          MovieSlider(height: height),
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.5,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black38,
                    Colors.black87,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: const Column(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      CenterIcons(),
                      Text(
                        'Version 82',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Bottom(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
