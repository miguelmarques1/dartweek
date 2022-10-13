import 'package:dartweek/app/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../home_page.dart';
import './home_view.dart';

abstract class HomeViewImpl extends State<HomePage> with Loader<HomePage>, Messages<HomePage> implements HomeView {


  UserModel? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUserData();
    });
    widget.presenter.view = this;
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccessful() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }

  @override
  void updateUser(UserModel user) {
    hideLoader();
    setState(() {
      this.user = user;
    });
  }

}