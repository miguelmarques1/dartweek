import 'package:dartweek/app/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../login_page.dart';
import './login_view.dart';

abstract class LoginViewImpl extends State<LoginPage> with Loader<LoginPage>, Messages<LoginPage> implements LoginView  {

  @override
  void initState() {
    // TODO: implement initState
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void success() {
    hideLoader();
    showSuccess("Login realizado com sucesso");
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }
}