import '../../../../core/network/api_client.dart';
import '../../../../core/error/exceptions.dart';
import '../models/home_data_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<HomeDataModel> getHomeData() async {
    try {
      // Mock implementation - replace with actual API call
      await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

      // Mock data for demonstration
      return const HomeDataModel(
        title: 'Welcome to Flashlight Cashier',
        subtitle: 'Your sales dashboard is ready',
        totalSales: 42,
        totalRevenue: 1250.75,
        recentTransactions: [
          'Sale #001 - Coffee & Pastry',
          'Sale #002 - Lunch Special',
          'Sale #003 - Beverage Set',
          'Sale #004 - Breakfast Combo',
          'Sale #005 - Dinner Package',
        ],
      );

      // TODO: Replace with actual API call
      // final response = await apiClient.get('/home/dashboard');
      // if (response.statusCode == 200) {
      //   return HomeDataModel.fromJson(response.data);
      // } else {
      //   throw ServerException('Failed to fetch home data');
      // }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException('Failed to fetch home data: $e');
    }
  }
}
