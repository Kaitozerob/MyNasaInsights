# MyNasaInsights

A cross-platform Flutter app that showcases NASA’s Astronomy Picture of the Day (APOD) or Mars Rover Photos API data. This app is designed for educational purposes, highlighting clean architecture and modern UI/UX principles.

## Features
- **View NASA's Images**: Displays NASA's **APOD (Astronomy Picture of the Day)** or **Mars Rover Photos**, depending on the user configuration.
- **Favorites**: Save favorite images for quick access.
- **Modern Design**: Implements Material Design 3 with a clean and responsive interface.
- **Cross-Platform**: Works seamlessly on Android and iOS.
- **State Management**: Uses `provider` for efficient state handling.

## Repository
This project is hosted on GitHub:
[MyNasaInsights Repository](https://github.com/Kaitozerob/MyNasaInsights.git)

## Getting Started

Follow these steps to get started with the project:

### Prerequisites
1. Install [Flutter](https://flutter.dev/docs/get-started/install) on your system.
2. Ensure the following tools are installed:
    - Android Studio or Visual Studio Code
    - Xcode (for iOS development)
    - A valid NASA API key (optional but recommended).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Kaitozerob/MyNasaInsights.git
   cd MyNasaInsights
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App
1. Connect a device or start an emulator/simulator.
2. Run the app:
   ```bash
   flutter run
   ```

### Testing
Run tests to ensure the app is functioning as expected:
```bash
flutter test
```

## Project Structure
The app follows a **feature-first architecture**:
```
lib/
├── core/                    # Shared resources like constants
├── shared/                  # Common UI components (e.g., HomePage)
├── feature/insights/        # Insights-specific functionality
│   ├── data/                # API and local database handling
│   ├── domain/              # Business logic and models
│   ├── presentation/        # UI for Insights feature
│   │   ├── pages/           # Individual screens (e.g., ShowDataPage, FavoritesPage)
│   │   └── widgets/         # Reusable components
└── main.dart                # App entry point
```

## Assets
Ensure the following assets are included in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/space.png
    - assets/images/u202223781.png
```

## Dependencies
Key dependencies used in this project:
- [flutter](https://flutter.dev): For building cross-platform apps.
- [provider](https://pub.dev/packages/provider): For state management.
- [http](https://pub.dev/packages/http): For API calls.

## Future Improvements
- **Dark Mode**: Add support for dark mode to enhance user experience.
- **Search Functionality**: Enable users to search through NASA’s image database.
- **Animations**: Integrate subtle animations for smoother UI transitions.
- **Localization**: Support for multiple languages.

## Contributing
We welcome contributions! To contribute:
1. Fork the repository.
2. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Description of changes"
   ```
4. Push your branch and create a pull request.

## License
This project is licensed under the MIT License.

## Credits
- Developed by **Joan Talizo Balbin** as part of an educational project.
- NASA APIs: [APOD](https://api.nasa.gov/) and [Mars Rover Photos](https://api.nasa.gov/).
- Inspired by the beauty of space and clean app design principles.
