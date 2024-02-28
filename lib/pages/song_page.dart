import 'package:flutter/material.dart';
import 'package:music_player/services/providers/playlist_provider.dart';
import 'package:music_player/widgets/neu_box_widget.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
        builder: (context, playlistProvider, child) {
      final playlist = playlistProvider.playlist;
      final currentSong = playlist[playlistProvider.currentSongIndex ?? 0];
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      const Text("P L A Y L I S T"),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.menu))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: MyNeuBox(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              currentSong.albumArtImagepAth,
                              height: 300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentSong.songName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(currentSong.artistName)
                                  ],
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(formatTime(playlistProvider.currentDuration)),
                            InkWell(
                              onTap: playlistProvider.shufflePlaylist,
                              child: Icon(
                                playlistProvider.isRandom
                                    ? Icons.shuffle_on_outlined
                                    : Icons.shuffle,
                              ),
                            ),
                            InkWell(
                              onTap: playlistProvider.repeatSong,
                              child: Icon(
                                playlistProvider.isRepeat
                                    ? Icons.repeat_on_outlined
                                    : Icons.repeat,
                              ),
                            ),
                            Text(formatTime(playlistProvider.totalDuration))
                          ],
                        ),
                        Slider(
                          min: 0,
                          max: playlistProvider.totalDuration.inSeconds
                              .toDouble(),
                          value: playlistProvider.currentDuration.inSeconds
                              .toDouble(),
                          activeColor: Colors.green,
                          onChanged: (double doubl) {},
                          onChangeEnd: (double doubl) {
                            playlistProvider
                                .seek(Duration(seconds: doubl.toInt()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: playlistProvider.playPreviousSong,
                              child: const MyNeuBox(
                                child: Icon(Icons.skip_previous),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: playlistProvider.pauseOrResume,
                              child: MyNeuBox(
                                child: Icon(playlistProvider.isPlayng
                                    ? Icons.pause
                                    : Icons.play_arrow),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: playlistProvider.playNextSong,
                              child: const MyNeuBox(
                                child: Icon(Icons.skip_next),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
