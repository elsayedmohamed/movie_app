import 'package:dartz/dartz.dart';
import '../entites/movie_detail.dart';
import '../usecases/get_recommindation_usecase.dart';
import '../entites/movie.dart';

import '../../../core/error/failure.dart';
import '../entites/recommendation.dart';
import '../usecases/get_movie_details_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParameter movieDetailParameter);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameter parameter);
   
      
}
