# Notes App

## Overview

The Notes App is a Flutter application developed with Flutter 3.10.0 and Dart 3.0.0. It uses the Bloc pattern for state management and follows Clean Architecture principles. The app features an industrial theme and integrates various utilities for improved functionality and development efficiency.

## Project Structure
![Project Structure](https://private-user-images.githubusercontent.com/89655817/342064083-7072359b-cf6b-49d1-bc89-5317c9e35846.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTkxNDU3MzYsIm5iZiI6MTcxOTE0NTQzNiwicGF0aCI6Ii84OTY1NTgxNy8zNDIwNjQwODMtNzA3MjM1OWItY2Y2Yi00OWQxLWJjODktNTMxN2M5ZTM1ODQ2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA2MjMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwNjIzVDEyMjM1NlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWEwNTJhMjhmM2IwNzQ5MzExNDA4ZmE1MDc3YzJhYzcwOTE3YzI3YzUwMjBjM2MxMTdjZDQ5YTUzMWY5YzYxOTUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.okBk5_skFx6F3w3Z9UwQGSh7GU5CkctMoAmv0YOYOIg)

## Features

-   Fetch All Notes
-   Add Note
-   Edit Note
-   Delete Note
-   Search Note

## Dependencies

Add the following dependencies to your `pubspec.yaml` file:
![pubspec.yaml](https://private-user-images.githubusercontent.com/89655817/342063851-126302c8-1c9c-4cb1-bf53-e050d3eca9e9.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTkxNDU0OTMsIm5iZiI6MTcxOTE0NTE5MywicGF0aCI6Ii84OTY1NTgxNy8zNDIwNjM4NTEtMTI2MzAyYzgtMWM5Yy00Y2IxLWJmNTMtZTA1MGQzZWNhOWU5LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDA2MjMlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQwNjIzVDEyMTk1M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTJiZGEzYjVkOTZjMDkxNzQzM2I0OGU5YTAxNWM0ODBmZWJiNDVjOWNhOThlMDI4YWNkMzgxYzUxMGU2MGFhZTUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0JmFjdG9yX2lkPTAma2V5X2lkPTAmcmVwb19pZD0wIn0.cRRa6hXmhmIFo6Mvizpiq8g61DFnsS7184vnk8oj1iU)

## Dependency Injection (DI)

Set up dependency injection using `GetIt` in `di/injector.dart`.

## Logger

Set up a logger utility in `utils/logger.dart` for debug logging and monitoring.

## Custom Navigation

Implement custom navigation with `GlobalKey<NavigatorState>` in `navigation_service.dart`.

## Bloc Implementation

Create and manage the application's state using Bloc in the `bloc/` directory.

## Data Layer

-   **Models**: Define data models in `data/models/`.
-   **Repository**: Handle data operations in `data/repository/`.
-   **Service**: Manage API requests in `data/service/dio_service.dart`, local storage in `data/service/secure_storage_service.dart`, and navigation in `data/service/navigation_service.dart`.

## Presentation Layer

-   **Pages**: Define UI pages in `presentation/pages/`.
-   **Widgets**: Create reusable UI components in `presentation/widgets/`.

## Utilities

-   **Theme**: Define the app's theme in `utils/app_theme.dart`.
-   **Colors**: Define app colors in `utils/app_colors.dart`.
-   **Routes**: Define navigation routes in `utils/app_routes.dart`.
-   **Enums**: Define enums in `utils/enum.dart`.

## Testing

-   Use `bloc_test` for Bloc testing.
-   Use `mockito` for mocking classes in unit tests.

## Getting Started

1.  Clone the repository.
2.  Install dependencies:
    `flutter pub get` 
    
3.  Generate JSON serialization code:
    `flutter pub run build_runner build` 
    
4.  Run the app:
    `flutter run` 
    

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Pub Dev](https://pub.dev/)

This readme provides an overview and instructions for setting up and running the Notes App. For detailed implementation, refer to the code files in the respective directories.
