# Portfolio Web (Flutter Monorepo)

Flutter web implementation of the provided Figma portfolio design, built with a customized feature-based clean architecture.

## Architecture

This repository follows a monorepo-style structure with explicitly separated layers:

- `packages/domain`:
  - Pure business layer
  - Entities, repository contracts, use cases
- `packages/data`:
  - Data layer
  - Mock local datasource, models, repository implementation
- `packages/feature`:
  - Feature/UI layer (custom replacement for traditional presentation layer)
  - Reusable feature widgets and feature state/controller
- `packages/core`:
  - Shared design system primitives
  - Theme, colors, responsive breakpoints, reusable UI widgets
- `lib/`:
  - App composition layer
  - Dependency registration and app bootstrap

### Important Constraint Applied

Per your requested customization, features are **not** split into nested `domain/data/presentation` subfolders. Domain and data remain globally separated from the feature layer.

## Folder Map

```text
.
├── assets/fonts
├── lib
│   ├── app
│   └── di
├── packages
│   ├── core
│   ├── data
│   ├── domain
│   └── feature
├── melos.yaml
└── pubspec.yaml
```

## Typography

Integrated local font files from web source:

- `Poppins-Regular.ttf`
- `Poppins-Medium.ttf`
- `Poppins-SemiBold.ttf`
- `Poppins-Bold.ttf`

Configured in root `pubspec.yaml` and applied through `AppTheme`.

## Data Source

Current implementation uses dummy/mock data from:

- `packages/data/lib/src/datasources/portfolio_local_data_source.dart`

## Run

```bash
flutter pub get
flutter run -d chrome
```

## Verify

```bash
flutter analyze
flutter test
flutter build web
```
