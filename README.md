# Flutter News App with BLoC and Get_it for Dependency Injection

This repository contains a Flutter app that demonstrates how to use the BLoC (Business Logic Component) pattern and integrate Git for version control. The app utilizes the New York Times API to fetch the most popular news articles. It consists of a single screen that displays the news headlines, and when a user taps on a headline, it launches a web view displaying the corresponding news article.

## Table of Contents

- [Features](#features)
- [Obtaining a New York Times API Key](#obtaining-a-new-york-times-api-key)
- [Updating Api_key](#updating_api_key)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

## Features

- Fetches and displays the most popular news articles from the New York Times API.
- Implements the BLoC pattern for managing state and business logic.
- Uses GetIt for dependency injection.
- Allows users to tap on a news headline to view the complete article in a web view.

## Obtaining a New York Times API Key

To fetch news articles from the New York Times API, you need to obtain an API key. Follow the steps below to acquire your API key:

1. Visit the [New York Times Developer Portal](https://developer.nytimes.com/get-started) and sign in with your New York Times account or create a new account if you don't have one.
2. Once you're signed in, navigate to the **APIs** section and click on **Get Started**.
3. Choose the API you want to access, such as the **Top Stories API** or the **Most Popular API**.
4. Follow the instructions provided to create a new application and generate an API key for the selected API.
5. Make sure to review and comply with the New York Times API [terms of service](https://developer.nytimes.com/tou) and any usage limitations they may have.
6. Copy the generated API key, as you will need it in the next steps for configuring the Flutter app.

_by the way there is a random api_key but it may be shut down for heavy use_

## Updating Api_key

head to lib/core/data/network/data_request.dart and update the `here` with the new key you granted from New York Times API

```dart
   DataRequest({
   this.host = APIConstants.host,
   this.defaultPath = APIConstants.defaultPath,
   this.path = const [],
   this.requestType = RequestType.get,
   this.headers = const {"Accept": "application/json"},
   this.urlParams = const {"api-key": "here"},
   this.params,
 });
```

## Installation

To run the app locally, please follow these steps:

1. Ensure that you have Flutter SDK installed on your machine. If not, refer to the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions on setting up Flutter.
2. Clone this GitHub repository using Git or download the ZIP file.
3. Open the project in your preferred Flutter IDE or editor (e.g., Android Studio, VS Code).
4. Install the project dependencies by running the following command in the terminal:

   ```bash
   flutter pub get
   ```

5. Connect a device or start an emulator.
6. Run the app using the following command:

   ```bash
   flutter run
   ```

   The app should now be running on your device/emulator.

## Usage

Once the app is installed and running, you can navigate through the headlines by scrolling on the home screen. When you find an article you are interested in, tap on it to open the full article in a web view.

Feel free to explore the codebase to understand the implementation details of the BLoC pattern, API integration, and Get_it for dependency injection. Make modifications, experiment with different features, and customize the app according to your needs.

## Dependencies

The app relies on the following dependencies:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - A state management library that implements the BLoC pattern.
- [http](https://pub.dev/packages/http) - A package for making HTTP requests to the New York Times API.
- [url_launcher](https://pub.dev/packages/url_launcher) - A package for launching URLs.
- [http](https://pub.dev/packages/http) - The HTTP client for Dart that supports various request features.
- [get_it](https://pub.dev/packages/get_it): A simple service locator for dependency injection.

For more details on the exact versions used, please refer to the pubspec.yaml file.
These dependencies are automatically resolved and fetched from the Dart package repository (pub.dev) during the installation process.

## Contributing

Contributions to this project are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Make sure to follow the project's code style and guidelines.

To contribute to the project, follow these steps:

1. Fork this repository.
2. Create a new branch for your feature or bug fix.
3. Make the necessary changes and commit your code.
4. Push your changes to your forked repository.
5. Submit a pull request to the original repository.

Please provide a detailed explanation of your changes and ensure that your code adheres to the project's coding conventions.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code as per the terms of the license.
