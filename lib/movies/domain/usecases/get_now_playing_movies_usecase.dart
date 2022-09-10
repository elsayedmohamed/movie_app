import 'package:dartz/dartz.dart';
import '../../../core/usecases/base_usecase.dart';
import '../repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);
  
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters)async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
 
}
