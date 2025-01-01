import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/presentation/movie_detail/movie_detail_page.dart';
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
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return MovieDetailPage(
              id: movie.id,
              heroTag: heroTag,
              imgUrl: movie.posterPath,
            );
          },
        ));
      },
      child: Hero(
        tag: heroTag,
        child: MovieImage(imgUrl: movie.posterPath),
      ),
    );
  }
}
