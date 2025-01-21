import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:netflix/controller/provider.dart';
import 'package:provider/provider.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetflixProvider>(context, listen: false)
          .searchMovies(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<NetflixProvider>(
          builder: (context, values, child) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: values.searchtext,
                  decoration: InputDecoration(
                    fillColor: Colors.white.withValues(alpha: 0.1),
                    filled: true,
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: (value) {
                    values.searchMovies(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<NetflixProvider>(
              builder: (context, values, child) => ListView.builder(
                itemCount: values.search.length,
                itemBuilder: (context, index) {
                  final data = values.search[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Icon(Icons.error_outline);
                            },
                            imageUrl:
                                'https://image.tmdb.org/t/p/w400/${data.posterpath}',
                            width: 100,
                          ),
                          Text(
                            data.title.toString(),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
