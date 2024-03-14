import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json; charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzOGY1OGY1Y2E5NjkwMjZiZTc5MDAzM2QzYTkxMTI0MyIsInN1YiI6IjY1ZjA1ZmU5MWY3NDhiMDE4NDUyMjY3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._jy7Ai4k4Ok8jm5R1vM3X2mrKEVKMlN5984ORXR9p1U'
        },
      ),
    );
  }
}
