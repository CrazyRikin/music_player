import 'package:flutter/material.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:music_player/services/models/song_model.dart';
import 'package:music_player/services/providers/playlist_provider.dart';
import 'package:music_player/widgets/drawer_widget.dart';
import 'package:music_player/widgets/mini_player.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playlistProviderVar;
  @override
  void initState() {
    super.initState();
    playlistProviderVar = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    playlistProviderVar.currentSongIndex = songIndex;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, playlistProvider, child) => Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: const Text("P L A Y L I S T"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: playlistProvider.playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlistProvider.playlist[index];
              return ListTile(
                onTap: () {
                  goToSong(index);
                },
                title: Text(song.songName),
                subtitle: Text(
                  song.artistName,
                ),
                leading: Image.asset(song.albumArtImagepAth),
              );
            },
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: MiniPlayer(),
        ),
      ),
    );
  }
}
