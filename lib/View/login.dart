import "package:chat_system/Controller/login_controller.dart";
import "package:chat_system/Utils/messages.dart";
import "package:chat_system/View/cadastro.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController _loginController = LoginController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: Form(
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
                ElevatedButton(
                  onPressed: () async {
                    Messages? response = await _loginController.loginUser(
                        email: _emailController.text,
                        senha: _senhaController.text);
                    if (response == Messages.USER_NOT_FOUND) {
                      debugPrint("Usuário não encontrado!");
                    } else if (response == Messages.WRONG_PASSWORD) {
                      debugPrint("Senha incorreta!");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text("Fazer login"),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(
                      () => const Cadastro(),
                    );
                  },
                  child: const Text("Não é cadastrado? Clique aqui!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
