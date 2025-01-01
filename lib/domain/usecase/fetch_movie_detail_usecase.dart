import 'package:flutter_clean_movie/domain/entity/movie_detail.dart';
import 'package:flutter_clean_movie/domain/repository/movie_repository.dart';

class FetchMovieDetailUsecase {
  FetchMovieDetailUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<MovieDetail?> execute(int id) async {
    return await _movieRepository.fetchMovieDetail(id);
  }
}
