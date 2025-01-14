import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/url.dart';
import 'package:netflix/model/netflixmodel.dart';

// ignore: must_be_immutable
class Viewscreen extends StatelessWidget {
  Netflixmodel? netflixmodel;

  Viewscreen({
    super.key,
    required this.netflixmodel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${netflixmodel!.orginaltitle}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: CachedNetworkImage(
                imageUrl:
                    "${Urlconstants.imageUrl}${netflixmodel!.backdroppath.toString()}",
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Text('${netflixmodel!.overview}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red[600],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow),
                    Text(
                      "Play",
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(CupertinoIcons.check_mark),
                      Text(
                        "My List",
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.thumb_up_sharp),
                      Text(
                        "Like",
                      )
                    ],
                  ),
                  Column(
                    children: [Icon(Icons.share), Text("Share")],
                  ),
                  SizedBox(
                    width: 150,
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text(
              "Trailers and More",
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${Urlconstants.imageUrl}${netflixmodel!.backdroppath}",
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
