import 'package:flutter/material.dart';
import 'package:netflix/controller/bottomProvider.dart';
import 'package:netflix/view/downloads/downlaods.dart';
import 'package:netflix/view/menu/menu.dart';
import 'package:netflix/view/searchpage/searchpage.dart';

import 'package:netflix/view/homescreen/homescreen.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatelessWidget {
  Bottombar({super.key});

  final pages = [Homescreen(), Searchpage(), Downlaods(), Menu()];

  @override
  Widget build(BuildContext context) {
    return Consumer<Bottomprovider>(
      builder: (context, value, child) => Scaffold(
        body: pages[value.currentindex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              value.onChange(index);
            },
            currentIndex: value.currentindex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu')
            ]),
      ),
    );
  }
}
