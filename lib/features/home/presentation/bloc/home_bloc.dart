import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_home_data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({required this.getHomeData}) : super(const HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<RefreshHomeData>(_onRefreshHomeData);
  }

  Future<void> _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());

    final result = await getHomeData();

    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (homeData) => emit(HomeLoaded(homeData: homeData)),
    );
  }

  Future<void> _onRefreshHomeData(RefreshHomeData event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) {
      emit(HomeRefreshing(homeData: (state as HomeLoaded).homeData));
    }

    final result = await getHomeData();

    result.fold((failure) {
      if (state is HomeRefreshing) {
        emit(HomeLoaded(homeData: (state as HomeRefreshing).homeData));
      } else {
        emit(HomeError(message: failure.message));
      }
    }, (homeData) => emit(HomeLoaded(homeData: homeData)));
  }
}
