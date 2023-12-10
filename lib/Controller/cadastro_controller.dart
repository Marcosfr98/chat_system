import 'package:chat_system/Utils/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroController {
  Future<Messages?> handleClick(
      {required String email, required String senha}) async {
    if (email.isNotEmpty && senha.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: senha,
        );
        return Messages.SUCCESS;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          debugPrint('The password provided is too weak.');
          return Messages.WEAK_PASSWORD;
        } else if (e.code == 'email-already-in-use') {
          debugPrint('The account already exists for that email.');
          return Messages.EMAIL_ALREADY_EXISTS;
        }
      } catch (e) {
        debugPrint(e.toString());
        Messages.BAD_REQUEST;
      }
    } else {
      debugPrint("Campos não podem ser vazios!");
      return Messages.EMPTY_VALUES;
    }
    return null;
  }
}
