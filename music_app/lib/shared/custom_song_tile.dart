import 'package:flutter/material.dart';
import 'package:music_app/second_screen.dart';

class CustomSongTile extends StatefulWidget {
  String currentSongName;
  CustomSongTile({required this.currentSongName});
  @override
  State<CustomSongTile> createState() => _CustomSongTileState();
}

class _CustomSongTileState extends State<CustomSongTile> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SecondScreen(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                child: Image.network(
                  "https://i.pinimg.com/236x/e4/ef/b1/e4efb137dec8a70485dd0b355f1c33a9.jpg",
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.currentSongName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Matt Maeson",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              ),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {
                      isfavorite = !isfavorite;
                    });
                  },
                  icon: Icon(
                    isfavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.green,
                  )),
              IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
