import "package:chat_system/Controller/home_controller.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _homeController = HomeController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _codController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat IFRS"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      padding: EdgeInsets.all(24.r),
                      height: 500.h,
                      width: ScreenUtil.defaultSize.width * .95,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Informações do bate-papo",
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value != null && value.length < 3) {
                                        return "O nome da sala deve conter no mínimo 3 dígitos!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: _nomeController,
                                    decoration: const InputDecoration(
                                      hintText: "Insira o nome da sala",
                                      labelText: "Nome da sala",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value != null && value.length != 6) {
                                        return "O código deve conter exatos 6 dígitos!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: _codController,
                                    decoration: const InputDecoration(
                                      hintText: "Insira o código da sala",
                                      labelText: "Código da sala",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Cancelar"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _homeController.criarChat(
                                          nome: _nomeController.text,
                                          cod: _codController.text);
                                    },
                                    child: const Text("Criar"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          splashColor: Colors.tealAccent,
          child: Ink(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 75.w,
                  height: 75.h,
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 35.r,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Clique na tela para criar um bate-papo",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
