import 'dart:convert';

import 'package:movie_app/decorators/movies_repository_decorator.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {

  MoviesCacheRepositoryDecorator(super.moviesRepository);

  @override
  Future<Movies?> getMovies(String page) async {
    try {
      Movies? movies = await super.getMovies(page);
      if (movies != null) {
        _saveInCache(movies);
      }
      return movies;
    } catch (e) {
      print(e);
      return await getInCache(page);
    }
  }

  _saveInCache(Movies movies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache ${movies.page}', jsonMovies);
  }

  Future<Movies?> getInCache(String page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache $page');
    if (moviesJsonString != null) {
      var json = jsonDecode(moviesJsonString);
      var movies = Movies.fromJson(json);
      return movies;
    }
    return null;
  }
}
