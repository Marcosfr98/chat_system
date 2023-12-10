import 'package:chat_system/Controller/cadastro_controller.dart';
import 'package:chat_system/Controller/login_controller.dart';
import 'package:chat_system/Utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _senhaConfirmaController =
      TextEditingController();
  final CadastroController _cadastroController = CadastroController();
  final LoginController _loginController = LoginController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: ListView(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 200.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Preencha com um valor válido!";
                    }
                  },
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    hintText: "Insira o seu nome",
                    labelText: "Nome",
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Preencha com um valor válido!";
                    }
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Insira o seu email",
                    labelText: "E-mail",
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Preencha com um valor válido!";
                    }
                  },
                  controller: _senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Insira a sua senha",
                    labelText: "Senha",
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != _senhaController.text) {
                      return "Senhas não conferem!";
                    } else if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Preencha com um valor válido!";
                    }
                  },
                  controller: _senhaConfirmaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Insira a sua senha novamente",
                    labelText: "Confirmação de senha",
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Messages? response =
                          await _cadastroController.handleClick(
                              email: _emailController.text,
                              senha: _senhaController.text);
                      if (response == Messages.SUCCESS) {
                        debugPrint("Cadastrado com sucesso!");
                        _loginController.loginUserPostRegistering(
                          nome: _nomeController.text,
                          email: _emailController.text,
                          senha: _senhaController.text,
                        );
                      } else if (response == Messages.WEAK_PASSWORD) {
                        debugPrint("Senha muito fraca!");
                      } else if (response == Messages.EMAIL_ALREADY_EXISTS) {
                        debugPrint("Email já cadastrado!");
                      } else if (response == Messages.BAD_REQUEST) {
                        debugPrint("Erro na requisição!");
                      } else {
                        debugPrint("Erro no servidor!");
                      }
                    } else {
                      debugPrint("Há algo errado com o formulário!");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text("Fazer cadastro"),
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
