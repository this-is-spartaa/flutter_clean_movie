import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie_detail.dart';

class MovieDetailGenres extends StatelessWidget {
  const MovieDetailGenres({
    super.key,
    required this.detail,
  });

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    final genres = detail.genres;
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.center,
            child: Text(
              genres[index],
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
