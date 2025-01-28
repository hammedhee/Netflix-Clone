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
  String? errorMessage;
  TextEditingController searchtext = TextEditingController();

  void errorMessages(String error) {
    errorMessage = error;
    notifyListeners();
  }

  Future<void> getAllData(BuildContext context) async {
    try {
      listOfData = await netflix.getAllNetflix();
    } catch (e) {
      errorMessages('$e');
    }

    notifyListeners();
  }

  Future<void> topRatedMovies(BuildContext context) async {
    try {
      topRated = await netflix.topRated();
    } catch (e) {
      errorMessages('$e');
    }

    notifyListeners();
  }

  Future<void> upcomingMovies(BuildContext context) async {
    try {
      upcoming = await netflix.upcoming();
    } catch (e) {
      errorMessages('$e');
    }

    notifyListeners();
  }

  Future<void> tvshows(BuildContext context) async {
    try {
      tvShow = await netflix.tvshows();
    } catch (e) {
      errorMessages('$e');
    }
    notifyListeners();
  }

  Future<void> searchMovies(BuildContext context) async {
    try {
      search = await netflix.searchUpdate(movie: searchtext.text);
    } catch (e) {
      errorMessages('$e');
    }
    notifyListeners();
  }
}
