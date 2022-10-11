import 'dart:developer';

import 'package:dartweek/app/models/register_user_model.dart';
import 'package:dartweek/app/pages/auth/register/view/register_view.dart';
import 'package:dartweek/app/repository/auth/auth_repository.dart';

import './register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {

  late RegisterView _view;
  final AuthRepository authRepository;

  RegisterPresenterImpl({required this.authRepository});

  @override
  Future<void> register({required String name, required String email, required String password, required String confirmPassword}) async {
    // TODO: implement register
    final registerUserModel = RegisterUserModel(email: email, name: name, password: password, confirmPassword: confirmPassword);

    try {
      await authRepository.register(registerUserModel);
      _view.registerSuccess();
    } catch (e) {
      log("Erro ao cadastrar o usuário", error: e);   
      _view.registerError("Deu erro");
    }
  }

  @override
  set view(RegisterView view) => _view = view;

}
