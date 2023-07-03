import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pikashow_clone/pages/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: MaterialApp(
        title: 'Pikashow Clone',
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const Homepage(),
      ),
    );
  }
}
