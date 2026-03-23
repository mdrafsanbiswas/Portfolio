import 'package:flutter/foundation.dart';

import 'package:domain/domain.dart';

class PortfolioController extends ChangeNotifier {
  PortfolioController({required GetPortfolioContentUseCase useCase})
    : _useCase = useCase;

  final GetPortfolioContentUseCase _useCase;

  bool isLoading = true;
  String? error;
  PortfolioContent? content;

  Future<void> load() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      content = await _useCase.call();
    } catch (_) {
      error = 'Unable to load portfolio content.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
