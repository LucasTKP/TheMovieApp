import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;

  MoviesRepositoryDecorator(this._moviesRepository);

  @override
  Future<Movies?> getMovies(String page) async {
    return await _moviesRepository.getMovies(page);
  }
}
