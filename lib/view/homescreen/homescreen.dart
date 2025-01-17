import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/constants/textconstants.dart';
import 'package:netflix/controller/provider.dart';
import 'package:netflix/view/homescreen/homewidget.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetflixProvider>(context, listen: false).getAllData(context);
      Provider.of<NetflixProvider>(context, listen: false).tvshows(context);
      Provider.of<NetflixProvider>(context, listen: false)
          .upcomingMovies(context);
      Provider.of<NetflixProvider>(context, listen: false)
          .topRatedMovies(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Consumer<NetflixProvider>(builder: (context, value, child) {
          final listOfdata = value.listOfData;
          if (listOfdata.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    height: 500,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    imageUrl: '${value.imagePath}${listOfdata[13].posterpath}',
                  ),
                  Positioned(
                    bottom: 0,
                    left: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.check,
                              size: 34,
                              color: Colors.white,
                            ),
                            Text(
                              'My List',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Gap(20),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 40,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                              Gap(5),
                              Text(
                                'Play',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(20),
                        Column(
                          children: [
                            Icon(
                              Icons.info,
                              size: 34,
                              color: Colors.white,
                            ),
                            Text(
                              'Info',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Textconstants.toprated,
                  style: TextStyle(color: Colors.white, fontSize: 34),
                ),
              ),
              topRatedwid(value.topRated),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Textconstants.upcoming,
                    style: TextStyle(color: Colors.white, fontSize: 34)),
              ),
              topRatedwid(value.upcoming),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Textconstants.tvShow,
                    style: TextStyle(color: Colors.white, fontSize: 34)),
              ),
              topRatedwid(value.tvShow)
            ],
          );
        })),
      ),
    );
  }
}
