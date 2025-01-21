import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/view/viewscreen/viewscreen.dart';

Widget topRatedwid(List movieList) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            final image = movieList[index].posterpath;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Viewscreen(
                            netflixmodel: movieList[index],
                          ),
                        ));
                  },
                  child: CachedNetworkImage(
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      // placeholder: (context, url) =>
                      //     Center(child: CircularProgressIndicator()),
                      imageUrl: 'https://image.tmdb.org/t/p/w400$image'),
                ),
              ),
            );
          },
        )),
  );
}
