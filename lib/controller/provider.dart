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
  String? errorMessage;
  TextEditingController searchtext = TextEditingController();

  void errorMessges(String error) {
    errorMessage = error;
    notifyListeners();
  }

  Future<void> getAllData(BuildContext context) async {
    flage = true;
    try {
      listOfData = await netflix.getAllNetflix();
    } catch (e) {
      errorMessges('$e');
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> topRatedMovies(BuildContext context) async {
    flage = true;

    try {
      topRated = await netflix.topRated();
    } catch (e) {
      errorMessges('$e');
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> upcomingMovies(BuildContext context) async {
    flage = true;

    try {
      upcoming = await netflix.upcoming();
    } catch (e) {
      errorMessges('$e');
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> tvshows(BuildContext context) async {
    try {
      flage = true;

      tvShow = await netflix.tvshows();
    } catch (e) {
      errorMessges('$e');
    } finally {
      flage = false;
      notifyListeners();
    }
  }

  Future<void> searchMovies(BuildContext context) async {
    flage = true;

    try {
      search = await netflix.searchUpdate(movie: searchtext.text);
    } catch (e) {
      errorMessges('$e');
    } finally {
      flage = false;
      notifyListeners();
    }
  }
}
