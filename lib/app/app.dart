import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';

import '../di/service_locator.dart';

void runPortfolioApp() {
  runApp(const PortfolioWebApp());
}

class PortfolioWebApp extends StatelessWidget {
  const PortfolioWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    final useCase = locator<GetPortfolioContentUseCase>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Portfolio',
      theme: AppTheme.lightTheme,
      home: PortfolioPage(useCase: useCase),
    );
  }
}
