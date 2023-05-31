// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Widgets/app_bar.dart';

class LiveTvPage extends StatefulWidget {
  const LiveTvPage({super.key});

  @override
  State<LiveTvPage> createState() => _LiveTvPageState();
}

class _LiveTvPageState extends State<LiveTvPage> {
  final MyAppBar _appBar = const MyAppBar(title: 'LiveTv');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: _appBar,
      ),
    );
  }
}
