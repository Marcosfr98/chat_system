import 'package:chat_system/Utils/messages.dart';
import 'package:chat_system/View/home.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController {
  Future<void> loginUserPostRegistering({
    required String nome,
    required String email,
    required String senha,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha);
      if (credential.user != null) {
        String uuid = credential.user!.uid;
        DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/$uuid");
        final senhaEncriptada = DBCrypt().hashpw(senha, DBCrypt().gensalt());
        await ref.set({"name": nome, "email": email, "senha": senhaEncriptada});
        debugPrint("usuário logado com sucesso!");
        Get.offAll(
          () => const Home(),
        );
      } else {
        debugPrint("Usuário não está logado!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  Future<Messages?> loginUser(
      {required String email, required String senha}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senha);
      debugPrint("Usuário logado com sucesso!");
      Get.offAll(
        () => const Home(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        return Messages.USER_NOT_FOUND;
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        return Messages.WRONG_PASSWORD;
      }
    }
    return null;
  }
}
