import 'package:flutter/material.dart';
import 'package:netflix/model/netflixmodel.dart';
import 'package:netflix/service/service.dart';

class NetflixProvider extends ChangeNotifier {
  String imagePath = 'https://image.tmdb.org/t/p/w400/';
  NetflixService netflix = NetflixService();
  List<Netflixmodel> listOfData = [];
  List<Netflixmodel> topRated = [];
  List<Netflixmodel> upcoming = [];
  List<Netflixmodel> tvShow = [];
  List<Netflixmodel> search = [];
  bool flage = false;
  TextEditingController searchtext = TextEditingController();
  Future<void> getAllData(BuildContext context) async {
    flage = true;
    notifyListeners();
    try {
      listOfData = await netflix.getAllNetflix();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> topRatedMovies(BuildContext context) async {
    flage = true;
    notifyListeners();
    try {
      topRated = await netflix.topRated();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> upcomingMovies(BuildContext context) async {
    flage = true;
    notifyListeners();
    try {
      upcoming = await netflix.upcoming();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> tvshows(BuildContext context) async {
    flage = true;
    notifyListeners();
    try {
      tvShow = await netflix.tvshows();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> searchMovies(BuildContext context) async {
    flage = true;
    notifyListeners();
    try {
      search = await netflix.searchUpdate(movie: searchtext.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flage = false;
      notifyListeners();
    }
  }
}
