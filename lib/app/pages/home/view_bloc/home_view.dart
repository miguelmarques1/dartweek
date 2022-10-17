
import 'package:bloc/bloc.dart';
import 'package:dartweek/app/models/user_model.dart';
import 'package:dartweek/app/pages/home/view_bloc/home_state.dart';

class HomeView extends Cubit<HomeState> {
  HomeView() : super(const HomeState.initial());


  void showLoader(){
    emit(state.copyWith(status: HomeStatus.loading));
  }


  void updateUser(UserModel user) {
    emit(state.copyWith(status: HomeStatus.loaded, user: user));
  }

  void error(String message) => emit(state.copyWith(status: HomeStatus.error, message: message));

  void logoutSuccessful() => emit(state.copyWith(status: HomeStatus.logout));
}