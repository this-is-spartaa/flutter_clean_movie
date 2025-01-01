import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/domain/repository/movie_repository.dart';

class FetchPopularMoviesUsecase {
  FetchPopularMoviesUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>?> execute() async {
    return await _movieRepository.fetchPopularMovies();
  }
}
