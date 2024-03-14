import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch(1);
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;
  ValueNotifier<int> page = ValueNotifier<int>(1);

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovies
        .where((element) =>
            element.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  Future<String> fetch(int alterPage) async {
    var result = await _moviesRepository.getMovies(alterPage.toString());
    if (result != null) {
      movies.value = result;
      _cachedMovies = movies.value;
      return 'success';
    } else {
      return 'error';
    }
  }

  void onChangedPage(String action) async {
    if (action == "sum" && page.value <= 3) {
      int newPage = page.value + 1;
      movies.value = null;
      var result = await fetch(newPage);
      if (result == 'success') {
        page.value = newPage;
        movies.value = _cachedMovies;
      } else {
        movies.value = _cachedMovies;
        Fluttertoast.showToast(
          msg: "Não foi possível mudar de pagina \nVerifique sua internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else if (action == "sub" && page.value > 1) {
      int newPage = page.value - 1;
      movies.value = null;
      var result = await fetch(newPage);
      if (result == 'success') {
        page.value = newPage;
      } else {
        movies.value = _cachedMovies;
        Fluttertoast.showToast(
          msg: "Não foi possível mudar de pagina \nVerifique sua internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }
}
