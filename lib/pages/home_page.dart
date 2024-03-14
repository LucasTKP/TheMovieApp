import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/decorators/movies_cache_repository_decorator.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import 'package:movie_app/widgets/custom_list_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImp(
        DioServiceImp(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // Use Stack para sobrepor elementos
          children: [
            Padding(
              padding: const EdgeInsets.all(28),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    ValueListenableBuilder<Movies?>(
                        valueListenable: _controller.movies,
                        builder: (_, movies, __) {
                          return Visibility(
                            visible: movies != null,
                            child: ValueListenableBuilder<int>(
                                valueListenable: _controller.page,
                                builder: (_, page, __) {
                                  return Column(
                                    children: [
                                      const Text(
                                        'Movies',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.arrow_circle_left_outlined,
                                              size: 40,
                                              color: _controller.page.value == 1
                                                  ? Colors.white38
                                                  : Colors.white,
                                            ),
                                            onPressed: () {
                                              _controller.onChangedPage("sub");
                                            },
                                          ),
                                          InkWell(
                                            child: Text(
                                              'Pagina ${_controller.page.value}',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.arrow_circle_right_outlined,
                                              size: 40,
                                              color: _controller.page.value == 4
                                                  ? Colors.white38
                                                  : Colors.white,
                                            ),
                                            onPressed: () {
                                              _controller.onChangedPage("sum");
                                            },
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        onChanged: _controller.onChanged,
                                      )
                                    ],
                                  );
                                }),
                          );
                        }),
                    ValueListenableBuilder<Movies?>(
                      valueListenable: _controller.movies,
                      builder: (_, movies, __) {
                        return movies != null
                            ? ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: movies.listMovies.length,
                                itemBuilder: (_, index) => CustomListCardWidget(
                                    movie: movies.listMovies[index]),
                                separatorBuilder: (_, __) => const Divider(),
                              )
                            : SizedBox(
                                height: MediaQuery.of(context)
                                    .size
                                    .height, // Defina a altura máxima do Column
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset('assets/lottie.json'),
                                  ],
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
