import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/domain/repository/movie_repository.dart';

class FetchPopularMoviesUsecase {
  FetchPopularMoviesUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>?> execute([int page = 1]) async {
    return await _movieRepository.fetchPopularMovies(page);
  }
}
