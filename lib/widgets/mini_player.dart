import 'package:flutter/material.dart';
import 'package:music_player/services/providers/playlist_provider.dart';
import 'package:provider/provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, playlistProvider, child) {
        Widget _content = playlistProvider.currentSongIndex == null
            ? ListTile(
                tileColor: Theme.of(context).colorScheme.inversePrimary,
                title: AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No Song Playing"),
                    ],
                  ),
                ),
              )
            : ListTile(
                tileColor: Theme.of(context).colorScheme.inversePrimary,
                leading: Image.asset(
                    playlistProvider
                        .playlist[playlistProvider.currentSongIndex!]
                        .albumArtImagepAth,
                    height: 50),
                title: Text(playlistProvider
                    .playlist[playlistProvider.currentSongIndex!].songName),
                subtitle: Text(playlistProvider
                    .playlist[playlistProvider.currentSongIndex!].artistName),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: playlistProvider.playPreviousSong,
                      child: const Icon(Icons.skip_previous, size: 32),
                    ),
                    InkWell(
                      onTap: playlistProvider.pauseOrResume,
                      child: Icon(
                          playlistProvider.isPlayng
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 32),
                    ),
                    InkWell(
                        onTap: playlistProvider.playNextSong,
                        child: const Icon(Icons.skip_next, size: 32)),
                  ],
                ),
              );

        return _content;
      },
    );
  }
}
