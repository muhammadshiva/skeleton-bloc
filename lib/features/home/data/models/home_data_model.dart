import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/home_data.dart';

part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.title,
    required super.subtitle,
    required super.totalSales,
    required super.totalRevenue,
    required super.recentTransactions,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);

  factory HomeDataModel.empty() => const HomeDataModel(
    title: '',
    subtitle: '',
    totalSales: 0,
    totalRevenue: 0.0,
    recentTransactions: [],
  );
}
