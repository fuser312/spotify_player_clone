import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Best of Hindi',
            style: TextStyle(
              fontSize: 24
            ),
          ),
        ),
        body: spotifyPlayer(),
      )
  ));
}

class spotifyPlayer extends StatefulWidget {
  @override
  _spotifyPlayerState createState() => _spotifyPlayerState();
}

class _spotifyPlayerState extends State<spotifyPlayer> {

  Song dummySong = Song(
      'Duniyaa',
      'https://p.scdn.co/mp3-preview/4efd033217aa13f4625d37f95efa676fb02d4778?cid=774b29d4f13844c495f206cafdad9c86',
      'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
      'Luka Chuppi');
  List<Song> allSongs = SongData().songs; // You are given a list of songs here for Stretch

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
