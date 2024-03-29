
import 'package:dartweek/app/pages/home/home_page.dart';
import 'package:dartweek/app/pages/home/presenter/home_presenter.dart';
import 'package:dartweek/app/pages/home/presenter/home_presenter_impl.dart';
import 'package:dartweek/app/repository/user/user_repository.dart';
import 'package:dartweek/app/repository/user/user_repository_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRoute extends FlutterGetItPageRoute {

  List<Bind<Object>> get bindings => [
    Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
    Bind.lazySingleton<HomePresenter>((i) => HomePresenterImpl(userRepository: i()))
  ];

  @override
  // TODO: implement page
  WidgetBuilder get page => (context) => HomePage(presenter: context.get());
  
}