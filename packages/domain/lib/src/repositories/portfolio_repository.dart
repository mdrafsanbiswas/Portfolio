import '../entities/portfolio_content.dart';

abstract class PortfolioRepository {
  Future<PortfolioContent> fetchPortfolioContent();
}
