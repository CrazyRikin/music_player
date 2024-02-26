import 'package:flutter/material.dart';
import 'package:music_player/services/models/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "Rolling in the deep",
        artistName: "Adele",
        albumArtImagepAth: "assets/images/rolling_in_the_deep_cover_image.webp",
        audioPath: "assets/music/rolling_in_the_deep.mp3"),
    Song(
        songName: "Sparkle Your Name",
        artistName: "Radwimps",
        albumArtImagepAth: "assets/images/sparkle_cover_image.jpg",
        audioPath: "assets/music/Sparkle.mp3"),
    Song(
        songName: "Hotel California",
        artistName: "Eagles",
        albumArtImagepAth: "assets/images/hotel_california_cover_image.jpg",
        audioPath: "assets/music/Eagles_Hotel_California.mp3"),
  ];

  int? _currentSongIndex;
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
}
