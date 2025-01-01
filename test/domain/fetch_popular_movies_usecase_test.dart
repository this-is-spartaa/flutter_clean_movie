import 'package:flutter_clean_movie/domain/entity/movie.dart';
import 'package:flutter_clean_movie/domain/repository/movie_repository.dart';
import 'package:flutter_clean_movie/domain/usecase/fetch_popular_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  MockMovieRepository? mockMovieRepository;
  FetchPopularMoviesUsecase? usecase;

  setUp(() async {
    mockMovieRepository = MockMovieRepository();
    usecase = FetchPopularMoviesUsecase(mockMovieRepository!);
  });

  // 현재 유즈케이스는 바이패스만 하고 있기 때문에 의미없는 테스트
  // 추후 유즈케이스 안에 로직이 추가되는 경우 대비해서 남겨둠
  test('FetchPopularMoviesUsecase : execute test', () async {
    when(() => mockMovieRepository!.fetchPopularMovies()).thenAnswer(
      (_) async => [
        Movie(
          id: 1,
          posterPath: 'https://test.com/image.png',
        ),
      ],
    );

    final result = await usecase!.execute();
    expect(result!.isEmpty, false);
    expect(result.first.id, 1);
    expect(result.first.posterPath, 'https://test.com/image.png');
  });
}
