import 'package:dartweek/app/core/rest/custom_dio.dart';
import 'package:dartweek/app/core/ui/global/global_context.dart';
import 'package:dartweek/app/core/ui/global/global_context_impl.dart';
import 'package:dartweek/app/core/ui/theme/theme_config.dart';
import 'package:dartweek/app/pages/auth/login/login_route.dart';
import 'package:dartweek/app/pages/auth/register/register_route.dart';
import 'package:dartweek/app/pages/home/home_route.dart';
import 'package:dartweek/app/pages/my_stickers/my_stickers_route.dart';
import 'package:dartweek/app/pages/splash/splash_route.dart';
import 'package:dartweek/app/pages/sticker_detail/sticker_detail_route.dart';
import 'package:dartweek/app/repository/auth/auth_repository_impl.dart';

import "package:flutter/material.dart";
import 'package:flutter_getit/flutter_getit.dart';


class FwcAlbumApp extends StatelessWidget {

  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepositoryImpl>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>((i) => GlobalContextImpl(navigatorKey: navigatorKey, authRepository: i()))
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeConfig.theme,
        title: "Fifa World Cup Album",
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (context) => const LoginRoute(),
          '/home': (context) => HomeRoute(),
          '/auth/register': (context) => const RegisterRoute(),
          '/my-stickers': (context) => const MyStickersRoute(),
          '/sticker-detail': (context) => StickerDetailRoute()
        }
      ),
    );
  }
}