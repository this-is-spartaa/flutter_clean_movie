import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/presentation/widgets/movie_image.dart';

class HeroMovieImage extends StatelessWidget {
  const HeroMovieImage({
    super.key,
    required this.heroTagPrefix,
    required this.movie,
  });

  final String heroTagPrefix;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final heroTag = '${heroTagPrefix}_${movie.id}';
    return GestureDetector(
      onTap: () {
        // TODO Move to DetailPage
      },
      child: Hero(
        tag: heroTag,
        child: MovieImage(imgUrl: movie.posterPath),
      ),
    );
  }
}
