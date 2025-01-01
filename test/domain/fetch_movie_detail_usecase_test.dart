import 'package:flutter_clean_movie/domain/entity/movie_detail.dart';
import 'package:flutter_clean_movie/domain/repository/movie_repository.dart';
import 'package:flutter_clean_movie/domain/usecase/fetch_movie_detail_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  MockMovieRepository? mockMovieRepository;
  FetchMovieDetailUsecase? usecase;

  setUp(() async {
    mockMovieRepository = MockMovieRepository();
    usecase = FetchMovieDetailUsecase(mockMovieRepository!);
  });

  // 현재 유즈케이스는 바이패스만 하고 있기 때문에 의미없는 테스트
  // 추후 유즈케이스 안에 로직이 추가되는 경우 대비해서 남겨둠
  test('FetchMovieDetailUsecase : execute test', () async {
    when(() => mockMovieRepository!.fetchMovieDetail(any())).thenAnswer(
      (_) async => MovieDetail(
        budget: 100,
        genres: ['액션'],
        id: 1,
        productionCompanyLogos: [],
        overview: 'overview',
        popularity: 222,
        releaseDate: DateTime(2024, 1, 1),
        revenue: 111,
        runtime: 222,
        tagline: 'tagline',
        title: 'title',
        voteAverage: 333,
        voteCount: 777,
      ),
    );

    final result = await usecase!.execute(1);
    expect(result, isNotNull);
    expect(result!.budget, 100);
    expect(result.genres.length, 1);
    expect(result.genres.first, '액션');
    expect(result.id, 1);
    expect(result.overview, 'overview');
    expect(result.popularity, 222);
    expect(result.releaseDate.year, 2024);
    expect(result.releaseDate.month, 1);
    expect(result.releaseDate.day, 1);
    expect(result.revenue, 111);
    expect(result.runtime, 222);
    expect(result.tagline, 'tagline');
    expect(result.title, 'title');
    expect(result.voteAverage, 333);
    expect(result.voteCount, 777);
  });
}
