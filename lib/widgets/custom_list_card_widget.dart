import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/pages/details_page.dart';
import 'package:movie_app/utils/apis.utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomListCardWidget extends StatelessWidget {
  Future<String> _getImage() async {
    // Simule um tempo de carregamento
    await Future.delayed(const Duration(seconds: 2));

    // Retorna a URL da imagem
    return API.REQUEST_IMG(movie.posterPath);
  }

  final Movie movie;
  const CustomListCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsPage(movie: movie),
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Hero(
                  tag: movie.id,
                  child: SizedBox(
                    width: 133,
                    child: CachedNetworkImage(
                      imageUrl: API.REQUEST_IMG(movie.posterPath),
                      placeholder: (context, url) => const AspectRatio(
                        aspectRatio: 1.0,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(height: 10),
                      Text('Popularidade: ${movie.popularity}'),
                      const SizedBox(height: 10),
                      Text('Votos: ${movie.voteAverage}'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
