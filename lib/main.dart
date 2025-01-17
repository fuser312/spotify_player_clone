import 'package:flutter/material.dart';
import 'package:spotify_player_clone/song.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
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

  AudioPlayer audioPlayer = new AudioPlayer();
  IconData playPauseButton = Icons.play_circle_filled;
  int i = 0;
  void playPause(){
      if(playPauseButton == Icons.play_circle_filled){
        playPauseButton = Icons.pause;
        audioPlayer.play(dummySong.playUrl);
      }
      else{
        playPauseButton = Icons.play_circle_filled;
        audioPlayer.pause();
      }
      setState(() {

      });

  }

  Song dummySong = Song(
      'Duniyaa',
      'https://p.scdn.co/mp3-preview/4efd033217aa13f4625d37f95efa676fb02d4778?cid=774b29d4f13844c495f206cafdad9c86',
      'https://i.scdn.co/image/f218335b215402cc2fb3b8d92652ebad48458805',
      'Luka Chuppi');
  List<Song> allSongs = SongData().songs; // You are given a list of songs here for Stretch

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 32, 8, 8),
      child:Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 8, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Image.network(
                    allSongs[i].imageUrl
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 48, 8, 8),
                child: Text(allSongs[i].name,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(allSongs[i].artistName,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(4, 24, 4, 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up, color: Colors.white,),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (i>0){
                            audioPlayer.pause();
                            i--;
                            audioPlayer.play(allSongs[i].playUrl);
                          }
                          else {
                            setState(() {
                              audioPlayer.pause();
                              i = allSongs.length-1;
                              audioPlayer.play(allSongs[i].playUrl);
                            });
                          }

                        });
                      },
                      icon: Icon(Icons.skip_previous, color: Colors.white,),
                    ),

                    IconButton(
                      iconSize: 56,
                      onPressed: playPause,
                      icon: Icon(playPauseButton, color: Colors.white,),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (i < allSongs.length){
                            audioPlayer.pause();
                            i++;
                            audioPlayer.play(allSongs[i].playUrl);
                            print(allSongs[i].playUrl);
                          }
                          else{
                            setState(() {
                              audioPlayer.pause();
                              audioPlayer.play(allSongs[0].playUrl);
                            });
                          }
                        });
                      },
                      icon: Icon(Icons.skip_next, color: Colors.white,),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_down, color: Colors.white,),
                    ),
                  ],
                ),
              )
          ],

        ),
      )
    );
  }
}