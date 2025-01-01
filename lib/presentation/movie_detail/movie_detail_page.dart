import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/presentation/movie_detail/widgets/movie_detail_info.dart';
import 'package:flutter_clean_movie/presentation/widgets/movie_image.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    super.key,
    required this.heroTag,
    required this.id,
    required this.imgUrl,
  });

  final int id;
  final String imgUrl;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: heroTag,
            child: MovieImage(imgUrl: imgUrl),
          ),
          MovieDetailInfo(id: id),
        ],
      ),
    );
  }
}
