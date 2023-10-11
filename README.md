# Onfly Test

## Project Description
[This Project is a proposed test by Onfly](https://gist.github.com/vitorfavila/cf863967c6591930ba93b7fcba23db08). Is a Flutter application developed to manage travel expenses. It allows users to efficiently record, view, edit, and delete expenses, both online and offline. The app employs a clean architecture to maintain separation of concerns and facilitate scalability.

## Instructions for Installation and Running the Application
To run the Onfly Test in your development environment, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/gabriel-bto/onfly_test.git

2. Navigate to the project directory:

   ```bash
   cd [YOUR_FILE_PATH]\onfly_test

3. Ensure that Flutter and Dart are installed on your system. If not, follow the instructions at [flutter.dev](https://docs.flutter.dev/get-started/install) for installation.

4. Install the project dependencies:

   ```bash
   flutter pub get

5. Run the application on an [emulator](https://www.geeksforgeeks.org/how-to-run-a-flutter-app-on-android-emulator/) or [connected device](https://stackoverflow.com/questions/54444538/how-do-i-run-test-my-flutter-app-on-a-real-device):

   ```bash
   flutter run

## Running Tests
The Onfly Test includes unit tests and widget tests to ensure code stability. To run the tests, follow these steps:

1. Navigate to the project directory:

   ```bash
   cd [YOUR_FILE_PATH]\onfly_test

2. Run unit tests:

   ```bash
   flutter test

3. Run widget tests:

   ```bash
   flutter test --widget-tests

## Summary Packages Used

* Local Data Persistence: Local storage is managed using the sqflite package for SQLite, allowing data to be stored and accessed locally.

* API Communication: Communication with the API is performed using the Dio package to make HTTP requests for data synchronization with the backend.

* Dependency Injection: Dependency injection is implemented using the get_it package to facilitate the replacement of implementations and code testability.

* File and Directory Handling: The path package is used for efficient manipulation of file and directory paths.

* Location Services: The geolocator package is utilized to access geographic location information, including latitude and longitude.

* Internationalization: Internationalization and date/number formatting are supported using the intl package.

* Connectivity Monitoring: The connectivity_plus package is employed for monitoring network connectivity and detecting connection changes.

