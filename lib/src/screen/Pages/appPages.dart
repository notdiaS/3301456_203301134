import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/src/screen/Pages/appPage1.dart';
import 'package:myapp/src/screen/Pages/appPage2.dart';
import 'package:myapp/src/screen/Pages/appPage3.dart';
import '../../constants/colors.dart';

class AppPages extends StatefulWidget {
  const AppPages({Key? key, required}) : super(key: key);

  @override
  State<AppPages> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPages> {
  int currentPageIndex = 0;
  var bcolor;

  List<Widget> pageList = <Widget>[
    const AppPage1(),
    const AppPage2(),
    const AppPage3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: pageList[currentPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentPageIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            iconSize: 27,
            selectedFontSize: 17.5,
            onTap: (index) => setState(() {
              currentPageIndex = index;
              if (index == 1) {
                bcolor = Colors.green;
              }
              else {
                bcolor = sPrimaryColor;
              }
            }
            ),
            backgroundColor: bcolor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.compass),
                label: 'Explore',
                backgroundColor: sPrimaryColor,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.robot),
                label: 'ChatGPT',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  activeIcon: FaIcon(FontAwesomeIcons.heartCircleCheck),
                  label: 'Saved',
                  backgroundColor: sPrimaryColor
              ),
            ],
            selectedItemColor: sFontColor,
          ),

    );
  }
}




