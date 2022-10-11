import 'package:dartweek/app/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../register_page.dart';
import './register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage> with Messages<RegisterPage>, Loader<RegisterPage> implements RegisterView {

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void registerError(String? message) {
    hideLoader();
    showError(message ?? "Erro ao registrar usuário");
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess("Usuário cadastrado com sucesso");
    Navigator.of(context).pop();
  }

}