import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/src/constants/colors.dart';
import 'package:myapp/src/constants/profileData.dart';
import 'package:myapp/src/models/userprofile_model.dart';

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
      backgroundColor: sExtraColor1,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: sFontColor),
        backgroundColor: sPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 80, right: 80),
          child: Text(
            'Profile',
            style: TextStyle(color: sFontColor, fontSize: 30),
          ),
        ),
      ),
      body: Stack(children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.25, color: sSecondaryColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.25, color: sAssistColor),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.25, color: sFontColor),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: FaIcon(
                      FontAwesomeIcons.fileSignature,
                      color: sPrimaryColor,
                    ),
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
                    color: sPrimaryColor,
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.25, color: sSecondaryColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.25, color: sAssistColor),
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
                    color: sPrimaryColor,
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
                color: sPrimaryColor),
          ),
          ListTile(
            title: const Text(
              'Male',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: sPrimaryColor),
            ),
            leading: Radio<Gender>(
              value: Gender.male,
              groupValue: gender,
              fillColor:
                  MaterialStateColor.resolveWith((states) => sPrimaryColor),
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
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: sPrimaryColor),
            ),
            leading: Radio<Gender>(
              value: Gender.female,
              groupValue: gender,
              fillColor:
                  MaterialStateColor.resolveWith((states) => sPrimaryColor),
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
                color: sPrimaryColor),
          ),
          SliderTheme(
            data: const SliderThemeData(
              thumbColor: sPrimaryColor,
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
          Row(
              children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: ElevatedButton(
                onPressed: () {
                  final user = UserProfile(
                    name: nameController.text,
                    surname: surnameController.text,
                    age: age,
                  );
                  createUser(user);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: sPrimaryColor,
                    foregroundColor: sFontColor),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: ElevatedButton(
                onPressed: () {

                  final docUser = FirebaseFirestore.instance.collection('User(s)').doc('t2AVctFS5irWRcPVQS2v');

                  docUser.update({
                    'Name': 'randomisim',
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: sPrimaryColor,
                    foregroundColor: sFontColor),
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),

          ]),
        ]),
      ]),
    );
  }
}
