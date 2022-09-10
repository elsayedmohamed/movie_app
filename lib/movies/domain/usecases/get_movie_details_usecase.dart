import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../entites/movie_detail.dart';
import '../repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, MovieDetailParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameter parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailParameter extends Equatable {
  final int movieId;
  const MovieDetailParameter({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
