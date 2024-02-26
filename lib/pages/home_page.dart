import 'package:flutter/material.dart';
import 'package:music_player/services/providers/playlist_provider.dart';
import 'package:music_player/widgets/drawer_widget.dart';
import 'package:music_player/widgets/playlist_builder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("P L A Y L I S T"),
      ),
      body: const PlaylistBuilder(),
    );
  }
}
