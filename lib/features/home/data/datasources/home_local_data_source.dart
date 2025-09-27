import 'dart:convert';
import '../../../../core/storage/local_storage.dart';
import '../../../../core/error/exceptions.dart';
import '../models/home_data_model.dart';

abstract class HomeLocalDataSource {
  Future<HomeDataModel> getLastHomeData();
  Future<void> cacheHomeData(HomeDataModel homeData);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final LocalStorage localStorage;
  static const String cachedHomeDataKey = 'CACHED_HOME_DATA';

  HomeLocalDataSourceImpl(this.localStorage);

  @override
  Future<HomeDataModel> getLastHomeData() async {
    try {
      final jsonString = await localStorage.getString(cachedHomeDataKey);
      if (jsonString != null) {
        final jsonMap = json.decode(jsonString);
        return HomeDataModel.fromJson(jsonMap);
      } else {
        throw const CacheException('No cached home data found');
      }
    } catch (e) {
      throw const CacheException('Failed to get cached home data');
    }
  }

  @override
  Future<void> cacheHomeData(HomeDataModel homeData) async {
    try {
      final jsonString = json.encode(homeData.toJson());
      await localStorage.setString(cachedHomeDataKey, jsonString);
    } catch (e) {
      throw const CacheException('Failed to cache home data');
    }
  }
}
