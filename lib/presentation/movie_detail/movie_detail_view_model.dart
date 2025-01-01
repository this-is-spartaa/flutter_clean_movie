import 'package:flutter_clean_movie/domain/entity/movie_detail.dart';
import 'package:flutter_clean_movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailViewModel
    extends AutoDisposeFamilyNotifier<MovieDetail?, int> {
  @override
  MovieDetail? build(int arg) {
    fetchDetail();
    return null;
  }

  Future<void> fetchDetail() async {
    state = await ref.read(fetchMovieDetailUsecaseProvider).execute(arg);
  }
}

final movieDetailViewModel = NotifierProvider.autoDispose
    .family<MovieDetailViewModel, MovieDetail?, int>(
  () => MovieDetailViewModel(),
);
