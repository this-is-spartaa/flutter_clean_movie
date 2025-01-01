import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final Movie? mostPopular;
  final List<Movie>? nowPlayingMovies;
  final List<Movie>? popularMovies;
  final List<Movie>? topRatedMovies;
  final List<Movie>? upcomingMovies;

  HomeState({
    required this.mostPopular,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });

  HomeState copyWith({
    Movie? mostPopular,
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
  }) {
    return HomeState(
      mostPopular: mostPopular ?? this.mostPopular,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    fetchAll();
    return HomeState(
      mostPopular: null,
      nowPlayingMovies: null,
      popularMovies: null,
      topRatedMovies: null,
      upcomingMovies: null,
    );
  }

  Future<void> fetchAll() async {
    await Future.wait([
      fetchNowPlayingMovies(),
      fetchPopularMovies(),
      fetchTopRatedMovies(),
      fetchUpcomingMovies(),
    ]);
  }

  Future<void> fetchNowPlayingMovies() async {
    final result =
        await ref.read(fetchNowPlayingMoviesUsecaseProvider).execute();
    state = state.copyWith(
      nowPlayingMovies: result ?? [],
    );
  }

  Future<void> fetchPopularMovies() async {
    final result = await ref.read(fetchPopularMoviesUsecaseProvider).execute();
    state = state.copyWith(
      mostPopular: result?.first,
      popularMovies: result ?? [],
    );
  }

  Future<void> fetchTopRatedMovies() async {
    final result = await ref.read(fetchTopRatedMoviesUsecaseProvider).execute();
    state = state.copyWith(
      topRatedMovies: result ?? [],
    );
  }

  Future<void> fetchUpcomingMovies() async {
    final result = await ref.read(fetchUpcomingMoviesUsecaseProvider).execute();
    state = state.copyWith(
      upcomingMovies: result ?? [],
    );
  }
}

final homeViewModel = NotifierProvider<HomeViewModel, HomeState>(
  () => HomeViewModel(),
);
