import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupDependencies() {
  if (locator.isRegistered<GetPortfolioContentUseCase>()) {
    return;
  }

  locator
    ..registerLazySingleton<PortfolioLocalDataSource>(
      MockPortfolioLocalDataSource.new,
    )
    ..registerLazySingleton<PortfolioRepository>(
      () => PortfolioRepositoryImpl(localDataSource: locator()),
    )
    ..registerLazySingleton<GetPortfolioContentUseCase>(
      () => GetPortfolioContentUseCase(locator()),
    );
}
