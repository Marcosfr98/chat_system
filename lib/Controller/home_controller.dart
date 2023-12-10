import 'package:chat_system/View/chat.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController {
  Future<void> criarChat({required String nome, required String cod}) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("salas/");
      await ref.set({
        cod: "",
      });
      Get.to(
        () => Chat(cod: cod),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
