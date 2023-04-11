import 'package:flutter/material.dart';
import '../../Widgets/widgets.dart';
import '../../repository/messages.dart';
import '../../constants/colors.dart';

class AppPage3 extends StatefulWidget {
  const AppPage3({Key? key}) : super(key: key);

  @override
  State<AppPage3> createState() => _AppPage3State();
}

class _AppPage3State extends State<AppPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sFavExtraColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              alignment: Alignment.topCenter,
              padding:
              const EdgeInsets.symmetric(
                vertical: 75,
                horizontal: 130,
              ),
              height: 200,
              decoration: BoxDecoration(
                color: sSecondaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "${messagesRepository.messages.length} Saved",
                style: TextStyle(color: sFavColor, fontWeight: FontWeight.bold,fontSize: 30),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) => SavedMessage(),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: messagesRepository.messages.length,
          )),
        ],
      ),
    );
  }
}

