import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/src/constants/colors.dart';
import 'package:myapp/src/constants/profileData.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: sPrimaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: sPrimaryColor),
        backgroundColor: sAssistColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 80, right: 80),
          child: Text(
            'Profile',
            style: TextStyle(color: sFontColor, fontSize: 30),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 60,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                    color: sFontColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "${nameController.text} ${surnameController.text}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const Divider(
                height: 25,
                color: sFontColor,
                thickness: 3,
                indent: 75,
                endIndent: 75,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.25, color: sSecondaryColor),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.25, color: sAssistColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.25, color: sFontColor),
                      ),
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        child: FaIcon(FontAwesomeIcons.fileSignature),
                      ),
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
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      labelStyle: const TextStyle(color: sPrimaryColor),
                      suffixIcon: IconButton(
                        onPressed: () {
                          nameController.clear();
                        },
                        icon: const Icon(FontAwesomeIcons.x, size: 15),
                        color: sAssistColor,
                      )),
                  controller: nameController,
                  cursorColor: sAssistColor,
                  cursorWidth: 2,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.25, color: sSecondaryColor),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.25, color: sAssistColor),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.25, color: sFontColor),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: sPrimaryColor,
                      )),
                      labelText: 'Surname',
                      hintText: 'Enter your surname',
                      labelStyle: const TextStyle(color: sPrimaryColor),
                      suffixIcon: IconButton(
                        onPressed: () {
                          surnameController.clear();
                        },
                        icon: const Icon(FontAwesomeIcons.x, size: 15),
                        color: sAssistColor,
                      )),
                  controller: surnameController,
                  cursorColor: sAssistColor,
                  cursorWidth: 2,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              const Divider(
                height: 25,
                color: sAssistColor,
                thickness: 5,
                indent: 30,
                endIndent: 30,
              ),
              const Text(
                'Gender',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: sAssistColor),
              ),
              ListTile(
                title: const Text(
                  'Male',
                  style: TextStyle(fontWeight: FontWeight.bold, color: sSecondaryColor),
                ),
                leading: Radio<Gender>(
                  value: Gender.male,
                  groupValue: gender,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => sAssistColor),
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                    'Female',
                style: TextStyle(fontWeight: FontWeight.bold, color: sSecondaryColor),
                ),
                leading: Radio<Gender>(
                  value: Gender.female,
                  groupValue: gender,
                  fillColor:
                      MaterialStateColor.resolveWith((states) => sAssistColor),
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              const Divider(
                height: 25,
                color: sAssistColor,
                thickness: 5,
                indent: 30,
                endIndent: 30,
              ),
              const Text(
                'Age',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: sAssistColor),
              ),
              SliderTheme(
                data: const SliderThemeData(
                  thumbColor: sAssistColor,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                  inactiveTrackColor: sSecondaryColor,
                  activeTrackColor: sFontColor,
                ),
                child: Slider(
                    value: age,
                    min: 18,
                    max: 65,
                    divisions: 65 - 18,
                    label: '$age',
                    onChanged: (double value) {
                      setState(() {
                        age = value;
                      });
                    }),
              ),
              const Divider(
                height: 25,
                color: sAssistColor,
                thickness: 5,
                indent: 30,
                endIndent: 30,
              ),
              const Text(
                'Employment Status',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: sAssistColor),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:25, top: 10,left: 10,right: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: sAssistColor,
                    border: Border.all(color: sAssistColor, width: 4),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: DropdownButton<String>(
                      value: employment,
                      items: currentEmployment
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          employment = value;
                          var employmentSB = SnackBar(
                            content: Text('You\'ve selected $value'),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(employmentSB);
                        });
                      },
                      style: const TextStyle(
                        color: sSecondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      dropdownColor: sAssistColor,
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
