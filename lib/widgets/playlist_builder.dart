import 'package:flutter/material.dart';
import 'package:music_player/services/models/song_model.dart';
import 'package:music_player/services/providers/playlist_provider.dart';
import 'package:provider/provider.dart';

class PlaylistBuilder extends StatelessWidget {
  const PlaylistBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, playlistProvider, child) => Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: playlistProvider.playlist.length,
          itemBuilder: (context, index) {
            final Song song = playlistProvider.playlist[index];
            return ListTile(
              title: Text(song.songName),
              subtitle: Text(
                song.artistName,
                style: TextStyle(color: Colors.grey.shade800),
              ),
              leading: Image.asset(song.albumArtImagepAth),
            );
          },
        ),
      ),
    );
  }
}
