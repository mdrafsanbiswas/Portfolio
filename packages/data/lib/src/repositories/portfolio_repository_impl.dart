import 'package:domain/domain.dart';

import '../datasources/portfolio_local_data_source.dart';
import '../models/portfolio_content_model.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  const PortfolioRepositoryImpl({required this.localDataSource});

  final PortfolioLocalDataSource localDataSource;

  @override
  Future<PortfolioContent> fetchPortfolioContent() async {
    final data = await localDataSource.loadPortfolioData();
    return PortfolioContentModel.fromJson(data).toEntity();
  }
}
