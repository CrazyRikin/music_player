import 'package:flutter/material.dart';
import 'package:music_player/pages/home_page.dart';
import 'package:music_player/services/providers/playlist_provider.dart';
import 'package:music_player/services/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => PlaylistProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomePage(),
    );
  }
}
