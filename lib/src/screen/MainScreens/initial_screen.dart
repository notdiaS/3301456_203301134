import 'package:flutter/material.dart';
import 'package:myapp/src/screen/MainScreens/sign_up.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../constants/colors.dart';
import '../../constants/images_str.dart';
import 'login.dart';

class Initial extends StatelessWidget {
  const Initial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var fontsize = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: sExtraColor1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: sPrimaryColor,
        title: const Center(
          child: Text(
            '',
            style: TextStyle(color: sFontColor, fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  alignment: Alignment.topCenter,
                  image: const AssetImage(sInitialScreenImage),
                  height: height * 0.439,
                  width: width,
                ),
                Container(
                  constraints: BoxConstraints.expand(
                    height: height*0.22,
                  ),
                  decoration:  const BoxDecoration(
                    color: sExtraColor2,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                  ),
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(0),
                  transformAlignment: Alignment.center,

                  child: GradientText(
                    'Greetings!',
                    style: TextStyle(
                      fontSize: fontsize*35,
                    ),
                    gradientType: GradientType.radial,
                    radius: 2.2,
                    colors: const [
                      sAssistColor,
                      sPrimaryColor,
                      Colors.yellow,
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,bottom: 2.0,top:8.0),
                    child: PhysicalModel(
                      color: sAssistColor,
                      shadowColor: sSecondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      elevation: 20,

                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: sPrimaryColor,
                          ),
                          child: const Text('Login')),
                    ),
                  ),
                ),
                SizedBox(
                  width: width*.10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0,bottom: 2.0,top:8.0),
                    child: PhysicalModel(
                      color: sAssistColor,
                      shadowColor: sSecondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      elevation: 20,
                      child: ClipRRect(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUp()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: sPrimaryColor,
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: sFontColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
