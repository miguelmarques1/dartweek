import 'package:dartweek/app/core/rest/custom_dio.dart';
import 'package:dartweek/app/core/ui/theme/theme_config.dart';
import 'package:dartweek/app/pages/home/home_page.dart';
import 'package:dartweek/app/pages/auth/login/login_page.dart';
import 'package:dartweek/app/pages/auth/register/register_page.dart';
import 'package:dartweek/app/pages/splash/splash_route.dart';
import 'package:dartweek/app/repository/auth/auth_repository_impl.dart';

import "package:flutter/material.dart";
import 'package:flutter_getit/flutter_getit.dart';


class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepositoryImpl>((i) => AuthRepositoryImpl(dio: i()))
      ],
      child: MaterialApp(
        theme: ThemeConfig.theme,
        title: "Fifa World Cup Album",
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/auth/register': (context) => const RegisterPage()
        }
      ),
    );
  }
}