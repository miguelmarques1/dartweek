import 'package:dartweek/app/core/ui/styles/button_styles.dart';
import 'package:dartweek/app/core/ui/styles/colors_app.dart';
import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:dartweek/app/pages/auth/login/view/login_view_impl.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/button.dart';

class LoginPage extends StatefulWidget {

  final LoginPresenter presenter;

  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {

  final _formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passEC = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEC.dispose();
    passEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover
            )
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(height: MediaQuery.of(context).size.height * (
                    MediaQuery.of(context).size.width > 350 ? .30 : .25
                  )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(child: Text("Login", style: context.textStyles.titleWhite,)),
                  ),
                  TextFormField(
                    controller: emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required("Obrigatório"),
                      Validatorless.email("Email incorreto")
                    ]),
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text("Email")
                    ),
                  ),
                  const SizedBox(
                       height: 20,
                    ),
                    TextFormField(
                      controller: passEC,
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(6, "Senha deve ter no mínimo 6 caracteres")
                      ]),
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text("Senha")
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "Esqueceu a senha?",
                      style: context.textStyles.textSecondaryFontMedium.copyWith(
                        color: context.colors.yellow, fontSize: 14
                      ),
                      ),
                  ),
                  const SizedBox(
                     height: 25,
                  ),
                  Button(
                    width: MediaQuery.of(context).size.width * 0.9,
                    onPressed: () {
                      showLoader();
                      widget.presenter.login(emailEC.text, passEC.text);
                    },
                    style: context.buttonStyles.yellowButton,
                    label: 'Entrar',
                    labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                  ),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        style: context.textStyles.textSecondaryFontMedium.copyWith(
                          color: Colors.white
                        ),
                        text: "Não possui uma conta?",
                        children: [
                          TextSpan(
                            text: " Cadastre-se",
                            style: context.textStyles.textPrimaryFontMedium.copyWith(
                              color: context.colors.yellow
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).pushNamed('/auth/register'),
                          )
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}