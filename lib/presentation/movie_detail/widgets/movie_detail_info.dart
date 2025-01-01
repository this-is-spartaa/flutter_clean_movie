import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/presentation/movie_detail/movie_detail_view_model.dart';
import 'package:flutter_clean_movie/presentation/movie_detail/widgets/movie_detail_box_office.dart';
import 'package:flutter_clean_movie/presentation/movie_detail/widgets/movie_detail_companies.dart';
import 'package:flutter_clean_movie/presentation/movie_detail/widgets/movie_detail_genres.dart';
import 'package:flutter_clean_movie/presentation/movie_detail/widgets/movie_detail_title_and_release.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailInfo extends StatelessWidget {
  const MovieDetailInfo({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final detail = ref.watch(movieDetailViewModel(id));
        if (detail == null) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ********** 기본정보 시작 **********
              // title, releaseDate, tagline, runtime, genres, overview
              MovieDetailTitleAndRelease(detail: detail),
              const SizedBox(height: 2),
              Text(detail.tagline),
              Text('${detail.runtime}분'),
              const Divider(),
              MovieDetailGenres(detail: detail),
              const Divider(),
              Text(detail.overview),
              const Divider(),
              // ********** 기본정보 끝 **********
              // ********** 흥행정보 시작 **********
              // voteAverage, voteCount, revenue, popularity, budget
              const SizedBox(height: 10),
              const Text(
                '흥행정보',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              MovieDetailBoxOffice(detail: detail),
              // ********** 흥행정보 끝 **********
              // ********** 제작사 **********
              // productionCompaniyLogos
              const SizedBox(height: 20),
              MovieDetailCompanies(detail: detail),
            ],
          ),
        );
      },
    );
  }
}
