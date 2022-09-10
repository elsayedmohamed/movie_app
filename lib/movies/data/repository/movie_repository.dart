import 'package:dartz/dartz.dart';
import '../../domain/entites/movie_detail.dart';
import '../../domain/entites/recommendation.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommindation_usecase.dart';
import '../../../core/error/failure.dart';
import '../data_source/movie_remote_data_source.dart';
import '../../domain/entites/movie.dart';
import '../../domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameter movieDetailParameter) async {
    final result =
        await baseMovieRemoteDataSource.getMovieDetail(movieDetailParameter);

    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameter parameter)async {
   final result =
        await baseMovieRemoteDataSource.getMovieRecommendations(parameter);

    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
  

}
