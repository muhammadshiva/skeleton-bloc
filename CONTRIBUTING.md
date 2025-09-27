# Contributing Guidelines

Thank you for your interest in contributing to Flashlight Cashier! This document provides guidelines and best practices for contributing to the project.

## 🤝 How to Contribute

### 1. **Fork and Clone**

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/your-username/flashlight_cashier.git
cd flashlight_cashier
```

### 2. **Set Up Development Environment**

```bash
# Install dependencies
flutter pub get

# Generate code
flutter packages pub run build_runner build

# Run the app
flutter run
```

### 3. **Create a Feature Branch**

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b bugfix/issue-description
```

## 📋 Development Workflow

### 1. **Code Style Guidelines**

#### Dart/Flutter Style

- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `dart format .` to format code
- Follow the existing code structure and patterns

#### Naming Conventions

```dart
// Classes: PascalCase
class HomeBloc extends Bloc<HomeEvent, HomeState> {}

// Variables and functions: camelCase
final String userName = 'John';
void getUserData() {}

// Constants: SCREAMING_SNAKE_CASE
static const String API_BASE_URL = 'https://api.example.com';

// Private members: underscore prefix
String _privateVariable = '';
void _privateMethod() {}
```

#### File Organization

```
lib/
├── core/
│   ├── constants/
│   ├── di/
│   ├── error/
│   ├── network/
│   └── storage/
├── features/
│   └── feature_name/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/
│   ├── themes/
│   └── widgets/
└── utils/
```

### 2. **Architecture Guidelines**

#### Clean Architecture Principles

- **Dependency Rule**: Dependencies point inward
- **Single Responsibility**: Each class has one reason to change
- **Open/Closed**: Open for extension, closed for modification
- **Interface Segregation**: Many specific interfaces are better than one general interface

#### BLoC Pattern

```dart
// Events
abstract class FeatureEvent extends Equatable {
  const FeatureEvent();
}

// States
abstract class FeatureState extends Equatable {
  const FeatureState();
}

// BLoC
class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
  FeatureBloc() : super(const FeatureInitial()) {
    on<FeatureEvent>(_onFeatureEvent);
  }
}
```

#### Repository Pattern

```dart
// Abstract repository
abstract class FeatureRepository {
  Future<Either<Failure, FeatureEntity>> getFeature();
}

// Implementation
class FeatureRepositoryImpl implements FeatureRepository {
  final FeatureRemoteDataSource remoteDataSource;
  final FeatureLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  // Implementation...
}
```

### 3. **Testing Requirements**

#### Unit Tests

- Test all business logic
- Mock external dependencies
- Achieve at least 80% code coverage

```dart
// Example unit test
group('HomeBloc', () {
  late HomeBloc homeBloc;
  late MockGetHomeData mockGetHomeData;

  setUp(() {
    mockGetHomeData = MockGetHomeData();
    homeBloc = HomeBloc(getHomeData: mockGetHomeData);
  });

  test('should emit [HomeLoading, HomeLoaded] when LoadHomeData is added', () async {
    // Arrange
    when(() => mockGetHomeData()).thenAnswer((_) async => const Right(homeData));

    // Act
    homeBloc.add(const LoadHomeData());

    // Assert
    expect(homeBloc.state, const HomeLoading());
    await untilCalled(() => mockGetHomeData());
    expect(homeBloc.state, const HomeLoaded(homeData: homeData));
  });
});
```

#### Widget Tests

```dart
// Example widget test
testWidgets('HomePage should display loading indicator when loading', (tester) async {
  // Arrange
  when(() => mockHomeBloc.state).thenReturn(const HomeLoading());

  // Act
  await tester.pumpWidget(createTestWidget());

  // Assert
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
});
```

#### Integration Tests

```dart
// Example integration test
testWidgets('Complete user flow', (tester) async {
  // Test complete user journey
  await tester.pumpWidget(MyApp());

  // Navigate through the app
  await tester.tap(find.byKey(const Key('login_button')));
  await tester.pumpAndSettle();

  // Verify final state
  expect(find.text('Welcome'), findsOneWidget);
});
```

### 4. **Documentation Requirements**

#### Code Documentation

```dart
/// A widget that displays home statistics.
///
/// This widget shows sales data and revenue information
/// in a card format with loading states.
class HomeStatsCard extends StatelessWidget {
  /// The total number of sales to display.
  final int totalSales;

  /// The total revenue amount to display.
  final double totalRevenue;

  /// Whether the card is in a loading state.
  final bool isLoading;

  /// Creates a [HomeStatsCard].
  const HomeStatsCard({
    super.key,
    required this.totalSales,
    required this.totalRevenue,
    this.isLoading = false,
  });
}
```

#### README Updates

- Update README.md for new features
- Update API documentation
- Update setup instructions if needed

### 5. **Commit Message Guidelines**

#### Format

```
type(scope): description

[optional body]

[optional footer]
```

#### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

#### Examples

```
feat(home): add sales statistics widget

Add a new widget to display daily sales statistics
with loading states and error handling.

Closes #123
```

```
fix(auth): resolve login validation issue

Fix email validation regex to properly handle
international email addresses.

Fixes #456
```

### 6. **Pull Request Process**

#### Before Submitting

1. **Run Tests**

   ```bash
   flutter test
   flutter test integration_test/
   ```

2. **Check Code Quality**

   ```bash
   flutter analyze
   dart format --set-exit-if-changed .
   ```

3. **Update Documentation**
   - Update README if needed
   - Add code comments
   - Update API documentation

#### PR Description Template

```markdown
## Description

Brief description of changes

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing

- [ ] Unit tests pass
- [ ] Widget tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Checklist

- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] Tests added/updated
```

## 🐛 Bug Reports

### Before Reporting

1. Check existing issues
2. Try to reproduce the issue
3. Check if it's already fixed in the latest version

### Bug Report Template

```markdown
## Bug Description

Clear description of the bug

## Steps to Reproduce

1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior

What should happen

## Actual Behavior

What actually happens

## Environment

- Flutter version:
- Dart version:
- OS:
- Device:

## Additional Context

Any other relevant information
```

## ✨ Feature Requests

### Before Requesting

1. Check if the feature already exists
2. Consider if it fits the project scope
3. Think about implementation complexity

### Feature Request Template

```markdown
## Feature Description

Clear description of the requested feature

## Use Case

Why is this feature needed?

## Proposed Solution

How should this feature work?

## Alternatives Considered

Other solutions you've considered

## Additional Context

Any other relevant information
```

## 🔧 Development Setup

### Required Tools

- Flutter SDK (3.8.0+)
- Dart SDK (3.8.0+)
- Android Studio / VS Code
- Git

### Recommended Extensions

- **VS Code**:

  - Dart
  - Flutter
  - Bracket Pair Colorizer
  - GitLens
  - Error Lens

- **Android Studio**:
  - Flutter plugin
  - Dart plugin

### Environment Setup

```bash
# Install Flutter
# Follow official Flutter installation guide

# Verify installation
flutter doctor

# Install dependencies
flutter pub get

# Generate code
flutter packages pub run build_runner build
```

## 📚 Learning Resources

### Clean Architecture

- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

### BLoC Pattern

- [BLoC Documentation](https://bloclibrary.dev/)
- [Flutter BLoC Tutorial](https://bloclibrary.dev/getting-started)

### Flutter Best Practices

- [Flutter Documentation](https://docs.flutter.dev/)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

## 🚫 What Not to Do

### Code Quality

- Don't commit code with `print()` statements
- Don't ignore linting warnings
- Don't skip tests for new features
- Don't commit large files or binaries

### Architecture

- Don't bypass the repository pattern
- Don't put business logic in UI components
- Don't create circular dependencies
- Don't ignore error handling

### Git Practices

- Don't commit directly to main branch
- Don't force push to shared branches
- Don't commit sensitive information
- Don't create unnecessary merge commits

## 📞 Getting Help

### Communication Channels

- **GitHub Issues**: For bugs and feature requests
- **Discussions**: For questions and ideas
- **Pull Requests**: For code reviews

### Code Review Process

1. **Automated Checks**: CI/CD pipeline runs tests
2. **Peer Review**: At least one team member reviews
3. **Approval**: Maintainer approval required
4. **Merge**: Squash and merge to main branch

## 🎯 Contribution Areas

### High Priority

- Bug fixes
- Performance improvements
- Security enhancements
- Documentation updates

### Medium Priority

- New features
- UI/UX improvements
- Test coverage
- Code refactoring

### Low Priority

- Code style improvements
- Minor optimizations
- Additional examples

## 🏆 Recognition

Contributors will be recognized in:

- README.md contributors section
- Release notes
- Project documentation

Thank you for contributing to Flashlight Cashier! 🚀
