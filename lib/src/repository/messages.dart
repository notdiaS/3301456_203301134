import 'package:myapp/src/constants/profileData.dart';

MessagesRepository messagesRepository = MessagesRepository();

String cUsername = "$nameController + " " + $surnameController";

class MessagesRepository {
  List<Message> messages = [
    Message("What can you answer ?", cUsername,
        DateTime.now().subtract(const Duration(seconds: 90))),
    Message("You may ama.", "GPT",
        DateTime.now().subtract(const Duration(seconds: 60))),
    Message("Whats the meaning of life ?", cUsername,
        DateTime.now().subtract(const Duration(seconds: 30))),
    Message("That i can't answer properly", "GPT",
        DateTime.now().subtract(const Duration(seconds: 15))),
    Message("As i tought.", cUsername, DateTime.now()),
  ];
}

class Message {
  String text;
  String sender;
  DateTime time;

  Message(this.text, this.sender, this.time);
}
