import 'package:flutter/material.dart';
// import 'package:music_app/musicScreen.dart';
import 'package:music_app/shared/custom_song_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> songNames = ["Dancing", "Hello", "Abc", "ghhhhoooo"];
  @override
  Widget build(BuildContext context) {
    return Container(
      /* decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Colors.blue, Colors.black])), */
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Colors.black12,
                          filled: true,
                          hintText: 'Find in liked songs',
                          hintStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 0),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'sort',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black12, elevation: 0),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                  child: Text(
                    'Liked Songs',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '106 songs',
                  style: TextStyle(color: Colors.white38, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(30, 215, 96, 1),
                          radius: 30,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.black,
                            size: 45,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.shuffle,
                              color: Colors.green,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: songNames.length,
                  itemBuilder: (_, i) {
                    return CustomSongTile(
                      currentSongName: songNames[i],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
