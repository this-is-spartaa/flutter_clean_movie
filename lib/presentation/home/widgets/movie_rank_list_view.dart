import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/presentation/home/widgets/hero_movie_image.dart';

class MovieRankListView extends StatelessWidget {
  const MovieRankListView({super.key, required this.movies});

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
          return SizedBox(
            width: 150,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: HeroMovieImage(
                    heroTagPrefix: 'RANK',
                    movie: movie,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      // 두자리수 글자 붙이려고
                      letterSpacing: -20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
