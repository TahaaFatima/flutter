import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  final List<String> song_title = [
    "Not Afraid",
    "Beautiful",
    "97 Bonnie & Clyde",
    "Lose Yourself",
    "New Divide",
    "Juat The Way You Are",
  ];
  List<String> song_author = [
    "Eminem",
    "Eminem",
    "Eminem",
    "Eminem",
    "Linkin Park",
    "Bruno Mars"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (ctx, i) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          tileColor: Colors.grey.withOpacity(0.3),
          leading: ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(0.0)), //add border radius here
            child: Image.asset(
                'assets/images/tabola-logo.png'), //add image location here
          ),
          title: Text(song_title[i]),
          subtitle: Text(song_author[i]),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.green.shade400,
              ), // icon-1
              Icon(Icons.more_vert), // icon-2
            ],
          ),
        );
      },
      itemCount: song_title.length,
      separatorBuilder: (ctx, i) {
        return Divider(
          height: 0,
          color: Colors.grey,
          indent: 20,
          endIndent: 20,
        );
      },
    );
  }
}
