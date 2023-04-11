
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';
import '../repository/messages.dart';


//MessageShowcase
class MessageShowcase extends StatelessWidget {
  final Message message;
  const MessageShowcase(this.message, {
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
      message.sender == cUsername ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: sSecondaryColor, width: 2),
            borderRadius:
            const BorderRadius.all(Radius.circular(10)),
            color: Colors.green.shade600,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(message.text),
          ),
        ),
      ),
    );
  }
}


//SavedMessage
class SavedMessage extends StatefulWidget {
  const SavedMessage( {
    super.key,
  });

  @override
  State<SavedMessage> createState() => _SavedMessageState();
}

class _SavedMessageState extends State<SavedMessage> {
 bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Text('📝'),
      title:  Text(
        'WIP',
        style: TextStyle(color: sFontColor),
      ),
      trailing: IconButton(
          onPressed: () {
           setState(() {
             isSaved = !isSaved;
           });
          }, icon: FaIcon(isSaved ? FontAwesomeIcons.heartCircleCheck : FontAwesomeIcons.heart),
    )
    );
  }
}
