import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/services/models/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  PlaylistProvider() {
    listenToDuration();
  }

  // playlist
  final List<Song> _playlist = [
    Song(
        songName: "Rolling in the deep",
        artistName: "Adele",
        albumArtImagepAth: "assets/images/rolling_in_the_deep_cover_image.webp",
        audioPath: "music/rolling_in_the_deep.mp3"),
    Song(
        songName: "Sparkle from Your Name",
        artistName: "Radwimps",
        albumArtImagepAth: "assets/images/sparkle_cover_image.jpg",
        audioPath: "music/Sparkle.mp3"),
    Song(
        songName: "Hotel California",
        artistName: "Eagles",
        albumArtImagepAth: "assets/images/hotel_california_cover_image.jpg",
        audioPath: "music/Eagles_Hotel_California.mp3"),
    Song(
        songName: "Summertime Sadness",
        artistName: "Lana Del Ray",
        albumArtImagepAth: "assets/images/summertime_sadness_cover.jpg",
        audioPath: "music/Summertime-Sadness.mp3")
  ];

  //songs page functionalities
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentSongIndex;
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;
  bool _isRandom = false;
  bool _isRepeat = false;

  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  bool get isPlayng => _isPlaying;
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  bool get isRandom => _isRandom;
  bool get isRepeat => _isRepeat;

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }

  void play() async {
    final String path;

    path = _playlist[_currentSongIndex!].audioPath;

    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    print("Normalplay() executed");

    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    print("pause() executed");
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    print("resume() executed");
    notifyListeners();
  }

  void pauseOrResume() async {
    if (_isPlaying == false) {
      resume();
    } else {
      pause();
    }
    notifyListeners();
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
    print("seek() executed");
    notifyListeners();
  }

  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
    print("playNextSong() executed");
    notifyListeners();
  }

  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
    print("playPreviousSong() executed");
    notifyListeners();
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((event) {
      _totalDuration = event;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((event) {
      _currentDuration = event;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      if (_currentSongIndex! == _playlist.length - 1) {
        currentSongIndex = 0;
      } else {
        currentSongIndex = _currentSongIndex! + 1;
      }

      notifyListeners();
    });
    notifyListeners();
    print("listenToDuration() executed");
  }

  void shufflePlaylist() {
    _isRandom = !_isRandom;

    notifyListeners();
  }

  void repeatSong() {
    _isRepeat = !_isRepeat;

    notifyListeners();
  }
}
