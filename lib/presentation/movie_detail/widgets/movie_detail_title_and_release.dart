import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/domain/entity/movie_detail.dart';

class MovieDetailTitleAndRelease extends StatelessWidget {
  const MovieDetailTitleAndRelease({
    super.key,
    required this.detail,
  });

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detail.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${detail.releaseDate.year}-${detail.releaseDate.month}-${detail.releaseDate.day}',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
