import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/src/constants/colors.dart';
import 'package:myapp/src/constants/images_str.dart';
import 'package:myapp/src/constants/profileData.dart';
import 'package:myapp/src/screen/MainScreens/initial_screen.dart';
import 'package:myapp/src/screen/SubScreen/profile_info.dart';
import '../../repository/login_info.dart';

class AppPage1 extends StatefulWidget {
  const AppPage1({Key? key}) : super(key: key);

  @override
  State<AppPage1> createState() => _AppPage1State();
}

class _AppPage1State extends State<AppPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: sPrimaryColor),
          backgroundColor: sAssistColor,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileInfo()),
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.addressCard,
                  color: sPrimaryColor,
                )),
          ]),
      backgroundColor: sExtraColor1,
      drawer: Drawer(
        backgroundColor: sAssistColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "${nameController.text} ${surnameController.text}",
                style: const TextStyle(color: sSecondaryColor),
              ),
              accountEmail: Text(
                "$eMail",
                style: TextStyle(color: sSecondaryColor),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(sDrawerAvatar),
              ),
              decoration: const BoxDecoration(
                color: sPrimaryColor,
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.gears),
              title: const Text('Settings'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.solidCircleQuestion),
              title: const Text('About Us'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
              title: const Text('Exit'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Initial()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          PageView(
            children: [
              Container(
                color: sExtraColor3,
                child:
                   Expanded(
                     child: Image(
                  alignment: Alignment.topCenter,
                  image: const AssetImage(sNewsImage),
                ),
                   ),
              ),
              Container(
                color: sExtraColor3,
                child:
                FittedBox(
                  child: Image(
                    image: const AssetImage(sUpdateImage1),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                color: sExtraColor3,
                child:
                Expanded(
                  child: Image(
                    alignment: Alignment.topCenter,
                    image: const AssetImage(sUpdateImage2),
                  ),
                ),
              ),
            ],

          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              height: 100,
              decoration: const BoxDecoration(
                color: sPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
