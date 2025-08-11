import 'package:dio/dio.dart';
import 'package:flutter_clean_movie/data/data_source/movie_data_source.dart';
import 'package:flutter_clean_movie/data/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:flutter_clean_movie/data/dto/movie_response_dto.dart/movie_response_dto.dart';

import 'package:flutter_clean_movie/env.dart';

class TmbdMovieDataSourceImpl implements MovieDataSource {
  TmbdMovieDataSourceImpl(this._dioClient) {
    _dioClient.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.uri.host == 'api.themoviedb.org') {
          options.headers.addAll(
            {
              "Authorization": "Bearer ${Env.tmdbKey}",
              'accept': 'application/json',
            },
          );
        }
        handler.next(options);
      },
    ));
  }

  final Dio _dioClient;
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';
  final _commonQueryParam = {
    'language': 'ko-KR',
    'page': 1,
  };

  /// https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    final response = await _dioClient.get(
      '$_baseUrl/now_playing',
      queryParameters: _commonQueryParam,
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/popular?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchPopularMovies([int page = 1]) async {
    final response = await _dioClient.get(
      '$_baseUrl/popular',
      queryParameters: {..._commonQueryParam, 'page': page},
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/top_rated?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    final response = await _dioClient.get(
      '$_baseUrl/top_rated',
      queryParameters: _commonQueryParam,
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/upcoming?language=ko-KR&page=1
  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    final response = await _dioClient.get(
      '$_baseUrl/upcoming',
      queryParameters: _commonQueryParam,
    );
    if (response.statusCode == 200) {
      return MovieResponseDto.fromJson(response.data);
    }
    return null;
  }

  /// https://api.themoviedb.org/3/movie/1?language=ko-KR
  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    final response = await _dioClient.get(
      '$_baseUrl/$id',
      queryParameters: {'language': 'language=ko-KR'},
    );
    if (response.statusCode == 200) {
      return MovieDetailDto.fromJson(response.data);
    }
    return null;
  }
}
