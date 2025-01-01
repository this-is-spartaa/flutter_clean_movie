import 'package:flutter/material.dart';
import 'package:flutter_clean_movie/presentation/home/home_view_model.dart';
import 'package:flutter_clean_movie/presentation/home/widgets/hero_movie_image.dart';
import 'package:flutter_clean_movie/presentation/home/widgets/home_label.dart';
import 'package:flutter_clean_movie/presentation/home/widgets/movie_horizontal_list_view.dart';
import 'package:flutter_clean_movie/presentation/home/widgets/movie_rank_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(homeViewModel);
        return ListView(
          children: [
            if (state.mostPopular != null) ...[
              const HomeLabel(label: '가장 인기있는'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: HeroMovieImage(
                  heroTagPrefix: 'MOST_POPULAR',
                  movie: state.mostPopular!,
                ),
              ),
            ],
            const HomeLabel(label: '현재 상영중'),
            MovieHorizontalListView(
              heroTagPrefix: 'NOW_PLAYING',
              movies: state.nowPlayingMovies ?? [],
            ),
            const HomeLabel(label: '인기순'),
            MovieRankListView(
              movies: state.popularMovies ?? [],
            ),
            const HomeLabel(label: '평점 높은순'),
            MovieHorizontalListView(
              heroTagPrefix: 'TOP_RATED',
              movies: state.topRatedMovies ?? [],
            ),
            const HomeLabel(label: '개봉예정'),
            MovieHorizontalListView(
              heroTagPrefix: 'UPCOMING',
              movies: state.upcomingMovies ?? [],
            ),
          ],
        );
      }),
    );
  }
}
