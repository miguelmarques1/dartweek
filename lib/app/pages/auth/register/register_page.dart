import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:dartweek/app/pages/auth/register/view/register_view_impl.dart';
import "package:flutter/material.dart";
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/button.dart';


class RegisterPage extends StatefulWidget {

  final RegisterPresenter presenter;

  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {

  final _formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                 height: 20,
              ),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bola.png"),
                    fit: BoxFit.fill
                  )
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text("Cadastrar Usuário",
              style: context.textStyles.titleBlack,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                children: [
                  TextFormField(
                    controller: nameEC,
                    validator: Validatorless.required("Obrigatório"),
                    decoration: const InputDecoration(label: Text("Nome Completo")),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: emailEC,
                    validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.email("E-mail inválido")
                      ]),
                    decoration: const InputDecoration(label: Text("Email")),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(6, "Senha deve ter no mínimo 6 caracteres")
                      ]),
                    controller: passwordEC,
                    decoration: const InputDecoration(label: Text("Senha")),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required("Obrigatório"),
                        Validatorless.min(6, "Senha deve ter no mínimo 6 caracteres"),
                        Validatorless.compare(passwordEC, "Senha diferente de confirmar senha")
                      ]),
                    controller: confirmPasswordEC,
                    decoration: const InputDecoration(label: Text("Confirmar Senha")),
                  ),
                  const SizedBox(height: 20,),
                  Button.primary(
                    label: "Cadastrar",
                    onPressed: () {
                      final formValid = _formKey.currentState?.validate() ?? false;
                      if(formValid) {
                        widget.presenter.register(name: nameEC.text, email: emailEC.text, password: passwordEC.text, confirmPassword: confirmPasswordEC.text);
                      }
                    },
                    width: MediaQuery.of(context).size.width * 0.9
                  )
                ],
              ),
              )
            ],
          )
          ),
      ),
    );
  }
}