import 'package:dio/dio.dart';
import '../models/movie_detail_model.dart';
import '../models/recommindation_model.dart';
import '../../domain/entites/movie_detail.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommindation_usecase.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/ntework/api_constants.dart';
import '../../../core/ntework/error_message_model.dart';
import '../../domain/entites/recommendation.dart';
import '../models/movies_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetail> getMovieDetail(MovieDetailParameter parameter);
  // Future<RecommendationModel> getMovieRecommendations(
  //     RecommendationParameter parameter);
  Future<List<RecommendationModel>> getMovieRecommendations(
      RecommendationParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerErrorException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerErrorException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerErrorException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetail> getMovieDetail(MovieDetailParameter parameter) async {
    final response =
        await Dio().get(ApiConstance.movieDetailPath(parameter.movieId));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerErrorException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendations(
      RecommendationParameter parameter) async {
    final response = await Dio().get(ApiConstance.movieRecommendationPath(parameter.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerErrorException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
