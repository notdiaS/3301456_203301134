import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widgets/widgets.dart';
import '../../constants/colors.dart';
import '../../repository/messages.dart';

class AppPage2 extends StatefulWidget {
  const AppPage2({Key? key}) : super(key: key);

  @override
  State<AppPage2> createState() => _AppPage2State();
}

class _AppPage2State extends State<AppPage2> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 150),
          child: Text(
            'Chat',
            style: TextStyle(color: sFontColor, fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messagesRepository.messages.length,
              itemBuilder: (context, index) {
                return MessageShowcase(messagesRepository.messages[messagesRepository.messages.length - index - 1]);
              },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: sSecondaryColor),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter message',
                        ),
                      ),
                    ),
                  ),
                )),
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.paperPlane,
                        color: sFontColor,
                      ),
                      onPressed: () {
                        print('');
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

