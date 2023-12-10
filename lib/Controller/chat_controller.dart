import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatController {
  Future<void> sendMessage(String cod, String message) async {
    DateTime now = DateTime.now();
    String date = "${now.hour} ${now.minute}";
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseAuth.instance.currentUser?.uid;
      debugPrint(FirebaseAuth.instance.currentUser?.uid);
    }
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("salas/$cod/$date/$uid/");
    await ref.set({
      "message": message,
    });
  }
}
