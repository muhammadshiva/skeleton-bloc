# Flashlight Cashier

A Flutter application built with Clean Architecture and BLoC pattern for cashier management and sales tracking.

## 🏗️ Architecture

This project follows **Clean Architecture** principles with **BLoC** state management:

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants (colors, strings, dimensions)
│   ├── di/                # Dependency injection
│   ├── error/             # Error handling
│   ├── network/           # Network layer
│   └── storage/           # Local storage
├── features/              # Feature modules
│   └── home/             # Home feature
│       ├── data/         # Data layer
│       ├── domain/       # Domain layer
│       └── presentation/ # Presentation layer
├── shared/               # Shared components
│   ├── themes/          # App themes
│   └── widgets/         # Reusable widgets
├── utils/               # Utility functions
├── app.dart            # App configuration
└── main.dart           # Entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.0 or higher)
- Dart SDK (3.8.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd flashlight_cashier
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code**

   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Features

- **Home Dashboard**: Sales overview with statistics
- **Clean Architecture**: Separation of concerns
- **BLoC State Management**: Reactive UI updates
- **Error Handling**: Comprehensive error management
- **Network Layer**: API integration with Dio
- **Local Storage**: Offline data persistence
- **Responsive Design**: Adaptive UI components
- **Theme System**: Light and dark mode support

## 🛠️ Tech Stack

- **Flutter**: Cross-platform framework
- **BLoC**: State management
- **Dio**: HTTP client
- **GetIt**: Dependency injection
- **SharedPreferences**: Local storage
- **JSON Annotation**: Code generation
- **Equatable**: Value equality
- **ScreenUtil**: Responsive design

## 📦 Dependencies

### Core Dependencies

- `flutter_bloc: ^9.1.1` - State management
- `dio: ^5.8.0` - HTTP client
- `get_it: ^8.2.0` - Dependency injection
- `shared_preferences: ^2.3.3` - Local storage
- `equatable: ^2.0.5` - Value equality

### Development Dependencies

- `build_runner: ^2.8.0` - Code generation
- `json_serializable: ^6.11.1` - JSON serialization
- `freezed: ^3.2.3` - Code generation

## 🏛️ Clean Architecture Layers

### Domain Layer

- **Entities**: Core business objects
- **Repositories**: Abstract data contracts
- **Use Cases**: Business logic

### Data Layer

- **Models**: Data transfer objects
- **Data Sources**: Remote and local data
- **Repositories**: Concrete implementations

### Presentation Layer

- **BLoC**: State management
- **Pages**: UI screens
- **Widgets**: Reusable components

## 🔧 Development

### Code Generation

```bash
# Generate JSON serialization
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch
```

### Code Analysis

```bash
# Run static analysis
flutter analyze

# Format code
dart format .
```

### Testing

```bash
# Run tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 📁 Project Structure

### Core Module

- **Constants**: App-wide constants
- **DI**: Dependency injection setup
- **Error**: Custom exceptions and failures
- **Network**: API client and connectivity
- **Storage**: Local data persistence

### Feature Module (Home)

- **Domain**: Business logic and entities
- **Data**: Data sources and models
- **Presentation**: UI and state management

### Shared Module

- **Themes**: Material Design themes
- **Widgets**: Reusable UI components

## 🎨 UI Components

### Custom Widgets

- `CustomButton`: Configurable button component
- `CustomTextField`: Enhanced text input
- `LoadingWidget`: Loading indicators
- `LoadingOverlay`: Full-screen loading

### Theme System

- Material Design 3
- Light and dark themes
- Custom color palette
- Responsive typography

## 🔄 State Management

### BLoC Pattern

- **Events**: User actions
- **States**: UI states
- **BLoC**: Business logic controller

### State Flow

```
User Action → Event → BLoC → Use Case → Repository → Data Source
                ↓
UI Update ← State ← BLoC ← Use Case ← Repository ← Data Source
```

## 🌐 Network Layer

### API Client

- Dio HTTP client
- Request/response interceptors
- Error handling
- Timeout configuration

### Data Sources

- **Remote**: API calls
- **Local**: Cached data
- **Repository**: Data orchestration

## 💾 Local Storage

### Storage Interface

- String, int, bool operations
- User-specific methods
- Token management
- First-time user detection

## 🚨 Error Handling

### Error Types

- `ServerFailure`: API errors
- `NetworkFailure`: Connectivity issues
- `CacheFailure`: Storage errors
- `ValidationFailure`: Input validation
- `UnknownFailure`: Unexpected errors

### Error Flow

```
Exception → Failure → Either<Failure, Success> → UI Error State
```

## 📱 Responsive Design

### Screen Adaptation

- ScreenUtil for responsive sizing
- Adaptive layouts
- Device-specific optimizations

### Breakpoints

- Mobile: 320px - 768px
- Tablet: 768px - 1024px
- Desktop: 1024px+

## 🧪 Testing Strategy

### Unit Tests

- Domain layer logic
- Use case testing
- Repository testing

### Widget Tests

- UI component testing
- State management testing
- User interaction testing

### Integration Tests

- End-to-end workflows
- API integration
- Database operations

## 🚀 Deployment

### Android

```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release
```

### iOS

```bash
# Build iOS
flutter build ios --release
```

## 📋 TODO

- [ ] Add authentication feature
- [ ] Implement product catalog
- [ ] Add sales transaction tracking
- [ ] Create reporting dashboard
- [ ] Add offline sync
- [ ] Implement push notifications
- [ ] Add user management
- [ ] Create settings page

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and questions, please contact the development team or create an issue in the repository.

---

**Built with ❤️ using Flutter and Clean Architecture**
