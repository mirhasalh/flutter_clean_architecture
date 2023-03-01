# flutter_clean_architecture

A TODO app project for flutter clean architecture with Riverpod.

## Installation
```bash
# Get dependencies
$ flutter pub get

# Run the Flutter app
$ flutter run
```

## Run scripts

```bash
flutter_scripts
```
Read about [flutter_scripts](https://pub.dev/packages/flutter_scripts) to prompt the cli command.

# Architecture layers

This project has three layers: the domain layer, the data layer, and the presentation layer. Each layer has its own set of responsibilities and contains different types that will be discussed in detail later.

## Domain layer

The domain layer is the business component on which your application relies. It is also the innermost layer, without dependencies on other layers, and contains the entity models, use cases, and repository. In simpler terms, it's literally what your company cares about it.

## Data layer

The data layer is a part of the outermost layer, responsible for retrieving data. This can take the form of API calls to a server and/or querying a local database. It also includes repository implementations.

## Presentation layer

The presentation layer of an application is typically the most framework-dependent layer, as it includes the user interface (UI) and event handlers. To display something on the screen, we need widgets, which are controlled by the state using the [Riverpod](https://riverpod.dev/) free boilerplate state management design pattern. This is the one of the most recommended approach within the Flutter ecosystem after [BLoC](https://bloclibrary.dev/#/).

## Getting Started with Flutter

A few resources to get started with Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
