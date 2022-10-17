import 'package:dartweek/app/pages/home/view/home_view.dart';
import 'package:dartweek/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './home_presenter.dart';

class HomePresenterImpl implements HomePresenter {

  UserRepository userRepository;

  HomePresenterImpl({required this.userRepository});

  late HomeView _view;

  @override
  Future<void> getUserData() async {
    _view.showLoader();
    try {
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } catch (e) {
      _view.error("Erro ao buscar dados do usuário");
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccessful();
  }

  @override
  set view(HomeView view) => _view = view;

}