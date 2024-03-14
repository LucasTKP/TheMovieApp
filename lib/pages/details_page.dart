import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/utils/apis.utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: CachedNetworkImage(
                    imageUrl: API.REQUEST_IMG(movie.posterPath),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.overview,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.title),
                  const SizedBox(width: 10), // Adiciona um espaço de 10 pixels
                  Text(movie.originalTitle),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.date_range),
                  const SizedBox(width: 10), // Adiciona um espaço de 10 pixels
                  Text(movie.releaseDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
