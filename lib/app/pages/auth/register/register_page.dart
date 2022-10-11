import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:dartweek/app/pages/auth/register/presenter/register_presenter.dart';
import "package:flutter/material.dart";

import '../../../core/ui/widgets/button.dart';


class RegisterPage extends StatefulWidget {

  final RegisterPresenter presenter;

  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
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
                    decoration: const InputDecoration(label: Text("Nome Completo")),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(label: Text("Email")),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(label: Text("Senha")),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(label: Text("Confirmar Senha")),
                  ),
                  const SizedBox(height: 20,),
                  Button.primary(
                    label: "Cadastrar",
                    onPressed: () {},
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