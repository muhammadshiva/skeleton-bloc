# API Documentation

## 🌐 API Overview

This document describes the API endpoints and data structures used in the Flashlight Cashier application.

## 🔗 Base Configuration

### Base URL

```
Production: https://api.flashlight-cashier.com/v1
Development: https://api-dev.flashlight-cashier.com/v1
Local: http://localhost:3000/v1
```

### Authentication

All API requests require authentication via Bearer token in the Authorization header:

```
Authorization: Bearer <access_token>
```

### Content Type

All requests and responses use JSON:

```
Content-Type: application/json
```

## 📊 Response Format

### Success Response

```json
{
  "success": true,
  "data": {
    // Response data
  },
  "message": "Operation successful",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Error Response

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "field": "email",
      "reason": "Invalid email format"
    }
  },
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## 🏠 Home Dashboard API

### Get Dashboard Data

```http
GET /home/dashboard
```

**Description**: Retrieves dashboard statistics and recent data.

**Headers**:

```
Authorization: Bearer <token>
Content-Type: application/json
```

**Response**:

```json
{
  "success": true,
  "data": {
    "title": "Welcome to Flashlight Cashier",
    "subtitle": "Your sales dashboard is ready",
    "totalSales": 42,
    "totalRevenue": 1250.75,
    "recentTransactions": [
      "Sale #001 - Coffee & Pastry",
      "Sale #002 - Lunch Special",
      "Sale #003 - Beverage Set",
      "Sale #004 - Breakfast Combo",
      "Sale #005 - Dinner Package"
    ],
    "statistics": {
      "todaySales": 15,
      "todayRevenue": 450.25,
      "weeklySales": 89,
      "weeklyRevenue": 2150.5,
      "monthlySales": 342,
      "monthlyRevenue": 8750.75
    },
    "trends": {
      "salesGrowth": 12.5,
      "revenueGrowth": 8.3,
      "customerGrowth": 15.2
    }
  },
  "message": "Dashboard data retrieved successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

**Error Codes**:

- `401` - Unauthorized
- `403` - Forbidden
- `500` - Internal Server Error

## 🔐 Authentication API

### Login

```http
POST /auth/login
```

**Description**: Authenticate user and return access token.

**Request Body**:

```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response**:

```json
{
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expiresIn": 3600,
    "user": {
      "id": "user_123",
      "email": "user@example.com",
      "name": "John Doe",
      "role": "cashier",
      "permissions": ["read", "write", "delete"]
    }
  },
  "message": "Login successful",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Register

```http
POST /auth/register
```

**Description**: Register a new user account.

**Request Body**:

```json
{
  "email": "newuser@example.com",
  "password": "password123",
  "name": "Jane Doe",
  "role": "cashier"
}
```

**Response**:

```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_456",
      "email": "newuser@example.com",
      "name": "Jane Doe",
      "role": "cashier",
      "createdAt": "2024-01-15T10:30:00Z"
    }
  },
  "message": "Registration successful",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Logout

```http
POST /auth/logout
```

**Description**: Logout user and invalidate token.

**Headers**:

```
Authorization: Bearer <token>
```

**Response**:

```json
{
  "success": true,
  "message": "Logout successful",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## 👤 User Profile API

### Get Profile

```http
GET /user/profile
```

**Description**: Get current user profile information.

**Headers**:

```
Authorization: Bearer <token>
```

**Response**:

```json
{
  "success": true,
  "data": {
    "id": "user_123",
    "email": "user@example.com",
    "name": "John Doe",
    "role": "cashier",
    "permissions": ["read", "write", "delete"],
    "createdAt": "2024-01-01T00:00:00Z",
    "lastLogin": "2024-01-15T10:30:00Z",
    "settings": {
      "theme": "light",
      "language": "en",
      "notifications": true
    }
  },
  "message": "Profile retrieved successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Update Profile

```http
PUT /user/profile
```

**Description**: Update user profile information.

**Headers**:

```
Authorization: Bearer <token>
Content-Type: application/json
```

**Request Body**:

```json
{
  "name": "John Smith",
  "settings": {
    "theme": "dark",
    "language": "es",
    "notifications": false
  }
}
```

**Response**:

```json
{
  "success": true,
  "data": {
    "id": "user_123",
    "email": "user@example.com",
    "name": "John Smith",
    "role": "cashier",
    "permissions": ["read", "write", "delete"],
    "createdAt": "2024-01-01T00:00:00Z",
    "lastLogin": "2024-01-15T10:30:00Z",
    "settings": {
      "theme": "dark",
      "language": "es",
      "notifications": false
    }
  },
  "message": "Profile updated successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## 🛍️ Products API

### Get Products

```http
GET /products?page=1&limit=20&category=coffee&search=latte
```

**Description**: Retrieve list of products with filtering and pagination.

**Query Parameters**:

- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 20, max: 100)
- `category` (optional): Filter by category
- `search` (optional): Search by name or description
- `sort` (optional): Sort field (name, price, created_at)
- `order` (optional): Sort order (asc, desc)

**Response**:

```json
{
  "success": true,
  "data": {
    "products": [
      {
        "id": "prod_123",
        "name": "Cappuccino",
        "description": "Rich espresso with steamed milk",
        "price": 4.5,
        "category": "coffee",
        "image": "https://api.example.com/images/cappuccino.jpg",
        "inStock": true,
        "stockQuantity": 50,
        "createdAt": "2024-01-01T00:00:00Z",
        "updatedAt": "2024-01-15T10:30:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalItems": 100,
      "itemsPerPage": 20,
      "hasNext": true,
      "hasPrev": false
    }
  },
  "message": "Products retrieved successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Get Product Details

```http
GET /products/{productId}
```

**Description**: Get detailed information about a specific product.

**Response**:

```json
{
  "success": true,
  "data": {
    "id": "prod_123",
    "name": "Cappuccino",
    "description": "Rich espresso with steamed milk and foam",
    "price": 4.5,
    "category": "coffee",
    "image": "https://api.example.com/images/cappuccino.jpg",
    "inStock": true,
    "stockQuantity": 50,
    "nutrition": {
      "calories": 120,
      "protein": 6,
      "carbs": 12,
      "fat": 4
    },
    "ingredients": ["espresso", "milk", "foam"],
    "allergens": ["dairy"],
    "createdAt": "2024-01-01T00:00:00Z",
    "updatedAt": "2024-01-15T10:30:00Z"
  },
  "message": "Product details retrieved successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## 🛒 Sales API

### Create Sale

```http
POST /sales
```

**Description**: Process a new sale transaction.

**Request Body**:

```json
{
  "items": [
    {
      "productId": "prod_123",
      "quantity": 2,
      "price": 4.5
    },
    {
      "productId": "prod_456",
      "quantity": 1,
      "price": 3.25
    }
  ],
  "paymentMethod": "cash",
  "discount": 0.5,
  "tax": 0.75,
  "total": 12.0,
  "customerId": "cust_789"
}
```

**Response**:

```json
{
  "success": true,
  "data": {
    "saleId": "sale_123",
    "items": [
      {
        "productId": "prod_123",
        "name": "Cappuccino",
        "quantity": 2,
        "price": 4.5,
        "subtotal": 9.0
      },
      {
        "productId": "prod_456",
        "name": "Croissant",
        "quantity": 1,
        "price": 3.25,
        "subtotal": 3.25
      }
    ],
    "paymentMethod": "cash",
    "discount": 0.5,
    "tax": 0.75,
    "total": 12.0,
    "change": 3.0,
    "customerId": "cust_789",
    "cashierId": "user_123",
    "createdAt": "2024-01-15T10:30:00Z"
  },
  "message": "Sale processed successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Get Sales History

```http
GET /sales?startDate=2024-01-01&endDate=2024-01-31&page=1&limit=20
```

**Description**: Retrieve sales history with date filtering and pagination.

**Query Parameters**:

- `startDate` (optional): Start date (YYYY-MM-DD)
- `endDate` (optional): End date (YYYY-MM-DD)
- `page` (optional): Page number
- `limit` (optional): Items per page
- `cashierId` (optional): Filter by cashier

**Response**:

```json
{
  "success": true,
  "data": {
    "sales": [
      {
        "saleId": "sale_123",
        "total": 12.0,
        "paymentMethod": "cash",
        "cashierId": "user_123",
        "cashierName": "John Doe",
        "createdAt": "2024-01-15T10:30:00Z"
      }
    ],
    "summary": {
      "totalSales": 150,
      "totalRevenue": 2500.75,
      "averageOrderValue": 16.67
    },
    "pagination": {
      "currentPage": 1,
      "totalPages": 10,
      "totalItems": 200,
      "itemsPerPage": 20
    }
  },
  "message": "Sales history retrieved successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## 📊 Reports API

### Get Sales Report

```http
GET /reports/sales?period=daily&date=2024-01-15
```

**Description**: Generate sales reports for different time periods.

**Query Parameters**:

- `period`: daily, weekly, monthly, yearly
- `date`: Specific date (YYYY-MM-DD)
- `startDate`: Start date for custom range
- `endDate`: End date for custom range

**Response**:

```json
{
  "success": true,
  "data": {
    "period": "daily",
    "date": "2024-01-15",
    "summary": {
      "totalSales": 45,
      "totalRevenue": 1250.75,
      "averageOrderValue": 27.79,
      "topSellingProduct": "Cappuccino",
      "peakHour": "14:00-15:00"
    },
    "hourlyBreakdown": [
      {
        "hour": "08:00-09:00",
        "sales": 5,
        "revenue": 125.5
      },
      {
        "hour": "09:00-10:00",
        "sales": 8,
        "revenue": 200.25
      }
    ],
    "productBreakdown": [
      {
        "productId": "prod_123",
        "productName": "Cappuccino",
        "quantity": 15,
        "revenue": 67.5
      }
    ]
  },
  "message": "Sales report generated successfully",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

## 🔧 Error Handling

### HTTP Status Codes

- `200` - OK: Request successful
- `201` - Created: Resource created successfully
- `400` - Bad Request: Invalid request data
- `401` - Unauthorized: Authentication required
- `403` - Forbidden: Insufficient permissions
- `404` - Not Found: Resource not found
- `409` - Conflict: Resource already exists
- `422` - Unprocessable Entity: Validation error
- `429` - Too Many Requests: Rate limit exceeded
- `500` - Internal Server Error: Server error

### Error Response Format

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "field": "email",
      "reason": "Invalid email format",
      "value": "invalid-email"
    }
  },
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Common Error Codes

- `VALIDATION_ERROR`: Input validation failed
- `AUTHENTICATION_ERROR`: Invalid credentials
- `AUTHORIZATION_ERROR`: Insufficient permissions
- `NOT_FOUND`: Resource not found
- `DUPLICATE_ERROR`: Resource already exists
- `RATE_LIMIT_ERROR`: Too many requests
- `SERVER_ERROR`: Internal server error

## 🔒 Security

### Authentication

- JWT tokens for authentication
- Token expiration handling
- Refresh token mechanism
- Secure token storage

### Rate Limiting

- 100 requests per minute per IP
- 1000 requests per hour per user
- Rate limit headers included in responses

### Data Validation

- Input sanitization
- SQL injection prevention
- XSS protection
- CSRF protection

## 📱 Mobile App Integration

### API Client Configuration

```dart
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }
}
```

### Error Handling

```dart
Exception _handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return const NetworkException('Connection timeout');
    case DioExceptionType.connectionError:
      return const NetworkException('No internet connection');
    case DioExceptionType.badResponse:
      return ServerException('Server error: ${e.response?.statusCode}');
    default:
      return const ServerException('Something went wrong');
  }
}
```

### Response Models

```dart
@JsonSerializable()
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final String timestamp;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
    required this.timestamp,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
```

## 🧪 Testing

### Mock API Responses

```dart
// Mock successful response
final mockResponse = {
  "success": true,
  "data": {
    "title": "Welcome to Flashlight Cashier",
    "subtitle": "Your sales dashboard is ready",
    "totalSales": 42,
    "totalRevenue": 1250.75,
    "recentTransactions": [
      "Sale #001 - Coffee & Pastry",
      "Sale #002 - Lunch Special"
    ]
  },
  "message": "Dashboard data retrieved successfully",
  "timestamp": "2024-01-15T10:30:00Z"
};
```

### API Testing

```dart
group('API Client Tests', () {
  late ApiClient apiClient;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    apiClient = ApiClient(mockDio);
  });

  test('should return dashboard data when API call succeeds', () async {
    // Arrange
    when(() => mockDio.get('/home/dashboard'))
        .thenAnswer((_) async => Response(
              data: mockResponse,
              statusCode: 200,
              requestOptions: RequestOptions(path: '/home/dashboard'),
            ));

    // Act
    final result = await apiClient.get('/home/dashboard');

    // Assert
    expect(result.statusCode, 200);
    expect(result.data['success'], true);
  });
});
```

## 📚 Additional Resources

- [API Documentation](https://api.flashlight-cashier.com/docs)
- [Postman Collection](https://api.flashlight-cashier.com/postman)
- [OpenAPI Specification](https://api.flashlight-cashier.com/openapi.json)
- [SDK Documentation](https://github.com/flashlight-cashier/sdk)

---

**Last Updated**: 2024-01-15
**API Version**: v1.0.0
**Contact**: api-support@flashlight-cashier.com
