import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix/constants/url.dart';

import 'package:netflix/model/netflixmodel.dart';

class NetflixService {
  final baseurl = Urlconstants.baseurl;
  Dio dio = Dio(BaseOptions(
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5)));

  Future<List<Netflixmodel>> getAllNetflix() async {
    try {
      final response = await dio.get(baseurl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        log('full data fetched');
        return data.map((e) => Netflixmodel.fromJson(e)).toList();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('sever error');
      }
    }
    throw Exception('error');
  }

  Future<List<Netflixmodel>> topRated() async {
    final topRated = Urlconstants.topRated.toString();

    try {
      final response = await dio.get(topRated);
      if (response.statusCode == 200) {
        log('fetched succesfully in toprated');
        List data = response.data['results'];
        return data.map((e) => Netflixmodel.fromJson(e)).toList();
      } else {
        throw Exception('error in fetlching data');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        log("connection errror");
        throw Exception('Connection error check your internet connection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error');
      }
    }
    throw Exception('error');
  }

  Future<List<Netflixmodel>> upcoming() async {
    final upcoming = Urlconstants.upcoming.toString();

    try {
      final response = await dio.get(upcoming);
      if (response.statusCode == 200) {
        log('fetched succesfully in upcoming');
        List data = response.data['results'];
        return data.map((e) => Netflixmodel.fromJson(e)).toList();
      } else {
        throw Exception('error in fetlching data');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('Connection error check your internet connection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error');
      }
    }
    throw Exception('error');
  }

  Future<List<Netflixmodel>> tvshows() async {
    final tvShows = Urlconstants.tvshows.toString();

    try {
      final response = await dio.get(tvShows);
      if (response.statusCode == 200) {
        log('fetched succesfully in upcoming');
        List data = response.data['results'];
        return data.map((e) => Netflixmodel.fromJson(e)).toList();
      } else {
        throw Exception('error in fetlching data');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('Connection error check your internet connection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error');
      }
    }
    throw Exception('error ');
  }

  Future<List<Netflixmodel>> searchUpdate({required String movie}) async {
    final search =
        'https://api.themoviedb.org/3/search/multi?api_key=d26a8dd97ecb04414d11287cd30cca91&query=$movie';
    try {
      final response = await dio.get(search);
      if (response.statusCode == 200) {
        log('fetched succesfully in upcoming');
        List data = response.data['results'];
        return data.map((e) => Netflixmodel.fromJson(e)).toList();
      } else {
        throw Exception('error in fetlching data');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('Connection error check your internet connection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error');
      }
    }
    throw Exception('no data');
  }
}
