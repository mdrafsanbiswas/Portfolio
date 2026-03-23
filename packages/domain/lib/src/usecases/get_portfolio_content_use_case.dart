import '../entities/portfolio_content.dart';
import '../repositories/portfolio_repository.dart';

class GetPortfolioContentUseCase {
  const GetPortfolioContentUseCase(this._repository);

  final PortfolioRepository _repository;

  Future<PortfolioContent> call() {
    return _repository.fetchPortfolioContent();
  }
}
