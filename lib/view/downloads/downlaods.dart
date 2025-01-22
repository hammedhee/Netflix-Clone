import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/provider.dart';
import 'package:provider/provider.dart';

class Downlaods extends StatefulWidget {
  const Downlaods({super.key});

  @override
  State<Downlaods> createState() => _DownlaodsState();
}

class _DownlaodsState extends State<Downlaods> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetflixProvider>(context, listen: false).tvshows(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Downlaods',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Consumer<NetflixProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.tvShow.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 150,
                width: 100,
                child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w400${value.imagePath}'),
              );
            },
          ),
        ));
  }
}
