import 'dart:async';
import 'dart:convert';

import 'package:chat_system/Controller/chat_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String cod;

  const Chat({super.key, required this.cod});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ChatController _chatController = ChatController();
  final TextEditingController _messageController = TextEditingController();
  String? _message;
  DatabaseReference ref = FirebaseDatabase.instance.ref('salas/');
  StreamSubscription? subscription;

  Future<void> getMessages() async {
    subscription = ref.child(widget.cod).onValue.listen(
      (DatabaseEvent event) {
        setState(() {
          _message = event.snapshot.value.toString();
        });
      },
    );
  }

  Map<String, dynamic> convertToJson(String? jsonString) {
    String formattedJson1 = jsonString!.replaceAll("{", "{\"");
    String formattedJson2 = formattedJson1.replaceAll(":", "\":");
    String formattedJson3 = formattedJson2.replaceAll("}", "\"}");
    String formattedJson4 = formattedJson3.replaceFirst("}\"}", "}}");
    String formattedJson5 = formattedJson4.replaceAll(": ", ": \"");
    String formattedJson6 = formattedJson5.replaceAll(": \"{", ": {");
    String formattedJson7 = formattedJson6.replaceAll("}}\"}", "}}}");
    String formattedJson8 = formattedJson7.replaceAll("}},", "}}, \"");
    return jsonDecode(formattedJson8);
  }

  @override
  void initState() {
    getMessages();
    super.initState();
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADS RESTINGA"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Builder(
                  builder: (contex) {
                    DateTime now = DateTime.now();
                    String date = "${now.hour} ${now.minute}";
                    return Text(convertToJson(_message!).toString() ?? "");
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        convertToJson(_message.toString());
                        _chatController.sendMessage(
                            widget.cod, _messageController.text);
                      },
                      child: const Icon(Icons.send),
                    ),
                    hintText: "Insira a sua mensagem",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
