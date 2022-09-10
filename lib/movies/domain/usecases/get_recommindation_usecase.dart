// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/domain/entites/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure,List<Recommendation>>> call(
      RecommendationParameter parameters) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }
}

class RecommendationParameter extends Equatable {
  final int id;
  const RecommendationParameter({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
