Skeleton Bloc

lib/
├── core/
│   ├── constants/          # API, app, colors, dimensions, strings
│   ├── di/                 # Dependency injection setup
│   ├── error/              # Custom exceptions and failures
│   ├── network/            # API client and network info
│   └── storage/            # Local storage abstraction
├── features/
│   └── home/
│       ├── data/           # Data sources, models, repositories
│       ├── domain/         # Entities, repositories, use cases
│       └── presentation/   # BLoC, pages, widgets
├── shared/
│   ├── themes/             # Light and dark themes
│   └── widgets/            # Reusable UI components
├── utils/                  # Extensions, helpers, validators
├── app.dart               # Main app configuration
└── main.dart              # App entry point

Architecture Components
✅ Core Layer:
- Error handling with custom failures and exceptions
- Network client with Dio integration
- Dependency injection using GetIt
- Local storage with SharedPreferences
- Constants for API endpoints, colors, dimensions, strings

✅ Features Layer (Home):
- Domain: Entities, repository interfaces, use cases
- Data: Models with JSON serialization, data sources, repository implementation
- Presentation: BLoC state management, pages, and widgets

✅ Shared Components:
- Material Design 3 themes (light/dark)
- Custom reusable widgets (buttons, text fields, loading)
- Responsive design with ScreenUtil

✅ Utilities:
- String and context extensions
- Form validators
- Helper functions for common operations
