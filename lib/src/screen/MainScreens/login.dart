import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/src/repository/login_info.dart';
import 'package:myapp/src/constants/images_str.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/constants/colors.dart';
import 'package:myapp/src/providers/firebase_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: sExtraColor1,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: sAssistColor),
        backgroundColor: sPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 90, right: 90),
          child: Text(
            'Login',
            style: TextStyle(color: sFontColor, fontSize: 30),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Image(
                      image: AssetImage(
                    sLoginScreenImage,
                  )),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            eMail = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sSecondaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sPrimaryColor),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sFontColor),
                            ),
                            prefixIcon: const Icon(Icons.mail),
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return sPrimaryColor;
                              }
                              if (states.contains(MaterialState.error)) {
                                return Colors.red;
                              }
                              return sSecondaryColor;
                            }),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: sPrimaryColor,
                            )),
                            labelText: 'E-Mail',
                            hintText: 'Enter your email',
                            labelStyle: const TextStyle(color: sPrimaryColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                emailController.clear();
                              },
                              icon: const Icon(FontAwesomeIcons.trashCan,
                                  size: 23),
                              color: sPrimaryColor,
                            )),
                        controller: emailController,
                        cursorColor: sAssistColor,
                        cursorWidth: 5,
                        maxLength: 50,
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            passWord = value;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sSecondaryColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sPrimaryColor),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: sFontColor),
                            ),
                            prefixIcon: const Icon(Icons.key),
                            prefixIconColor: MaterialStateColor.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return sPrimaryColor;
                              }
                              if (states.contains(MaterialState.error)) {
                                return Colors.red;
                              }
                              return sSecondaryColor;
                            }),
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            labelStyle: const TextStyle(color: sPrimaryColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                passwordController.clear();
                              },
                              icon: const Icon(FontAwesomeIcons.trashCan,
                                  size: 23),
                              color: sPrimaryColor,
                            )),
                        controller: passwordController,
                        cursorColor: sAssistColor,
                        cursorWidth: 5,
                        maxLength: 6,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 33, top: 4),
                  child: OutlinedButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<FlutterFireAuthService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context,
                        );
                      } else {
                        {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              backgroundColor: sPrimaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text(
                                      'Wrong login info.',
                                      style: TextStyle(color: sSecondaryColor),
                                    ),
                                    const SizedBox(height: 5),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(color: sFontColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: sPrimaryColor,
                    ),
                    child: const Text(
                      'Enter',
                      style: TextStyle(
                          color: sPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.google,
                            color: sPrimaryColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: sPrimaryColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.twitter,
                            color: sPrimaryColor,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 3, right: 3),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot your password ?',
                        style: TextStyle(color: sPrimaryColor),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
