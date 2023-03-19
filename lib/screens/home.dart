import 'dart:developer';

import 'package:flutter/material.dart';

import '../components/anime_heading.dart';
import '../utility/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Anime Tracker",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ShowRow(
                      img: "images/isagi1.png",
                      color: Colors.pinkAccent.shade100,
                    ),
                    ShowRow(
                      img: "images/rin.png",
                      color: Colors.greenAccent.shade100,
                    ),
                    ShowRow(
                      img: "images/isagi2.png",
                      color: Colors.blueAccent.shade100,
                    ),
                    ShowRow(
                      img: "images/rin.png",
                      color: Colors.purpleAccent.shade100,
                    ),
                    ShowRow(
                      img: "images/isagi1.png",
                      color: Colors.redAccent.shade100,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Top Animes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              TopAnimes(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Top Mangas',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              TopMangas(),
            ],
          ),
        ),
      ),
    );
  }
}

//Top Animes Row
class TopAnimes extends StatelessWidget {
  final AnimeData _animeData = AnimeData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _animeData.getAnimeData('https://api.jikan.moe/v4/top/anime'),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            final data = snapshot.data;
            // log(data["data"]);
            List<dynamic> topAnimes = (data["data"]);
            List<Widget> childs = [];
            log(topAnimes.length.toString());
            for (int i=0; i < topAnimes.length; i++){

              log(topAnimes[i]["images"]['jpg']["image_url"]);
              log(topAnimes[i]["title"]);

              childs.add(
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: AnimeRow(img_url: topAnimes[i]["images"]["jpg"]["image_url"], name: topAnimes[i]["title"]),
                )
              );
            }

            log(childs.length.toString());
            return (SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: childs,
              ),
            ));
            // return ListView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   itemCount: topAnimes.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Padding(
            //       padding: const EdgeInsets.only(left: 16.0),
            //       child: AnimeRow(img_url: topAnimes[index]["images"]["jpg"]["image_url"],
            //         name: topAnimes[index]["title"],
            //       ),
            //     );
            //   },
            // );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class TopMangas extends StatelessWidget {
  final AnimeData _animeData = AnimeData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _animeData.getAnimeData('https://api.jikan.moe/v4/top/manga'),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            final data = snapshot.data;
            // log(data["data"]);
            List<dynamic> topMangas = (data["data"]);
            List<Widget> childs = [];

            for (int i=0; i < topMangas.length; i++){

              log(topMangas[i]["images"]['jpg']["image_url"]);
              log(topMangas[i]["title"]);

              childs.add(
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AnimeRow(img_url: topMangas[i]["images"]["jpg"]["image_url"], name: topMangas[i]["title"]),
                  )
              );
            }


            return (SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: childs,
              ),
            ));

          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

// Individual Row
class AnimeRow extends StatelessWidget {
  AnimeRow({required this.img_url, required this.name});

  String img_url, name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          img_url,
          height: 200,
          width: 150,
          fit: BoxFit.fill,
        ),
        Text(name.substring(0, 3)),
      ],
    );
  }
}
