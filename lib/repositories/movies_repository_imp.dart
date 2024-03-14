import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';
import 'package:movie_app/service/dio_service.dart';
import 'package:movie_app/utils/apis.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies(String page) async {
    await Future.delayed(const Duration(seconds: 2));
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST(page));
    return Movies.fromJson(result.data);
  }
}
