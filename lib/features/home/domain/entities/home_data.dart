import 'package:equatable/equatable.dart';

class HomeData extends Equatable {
  final String title;
  final String subtitle;
  final int totalSales;
  final double totalRevenue;
  final List<String> recentTransactions;

  const HomeData({
    required this.title,
    required this.subtitle,
    required this.totalSales,
    required this.totalRevenue,
    required this.recentTransactions,
  });

  @override
  List<Object> get props => [title, subtitle, totalSales, totalRevenue, recentTransactions];
}
