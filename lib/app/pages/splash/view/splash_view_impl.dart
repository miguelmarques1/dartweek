import 'package:flutter/widgets.dart';

import '../../../core/ui/helpers/loader.dart';
import '../splash_page.dart';
import './splash_view.dart';

abstract class SplashViewImpl extends State<SplashPage> with Loader<SplashPage> implements SplashView {
  @override
  void logged(bool isLogged) {
    if(isLogged){
      hideLoader();
      Navigator.pushNamed(context, "/home");
    } else {
      hideLoader();
      Navigator.pushNamed(context, "/auth/login");
    }
  }

}