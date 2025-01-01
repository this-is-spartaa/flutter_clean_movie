import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/presentation/home/widgets/hero_movie_image.dart';

class MovieHorizontalListView extends StatelessWidget {
  const MovieHorizontalListView({
    super.key,
    required this.heroTagPrefix,
    required this.movies,
  });

  final String heroTagPrefix;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return HeroMovieImage(
            heroTagPrefix: heroTagPrefix,
            movie: movie,
          );
        },
      ),
    );
  }
}
