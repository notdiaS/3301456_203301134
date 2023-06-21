import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/profileData.dart';

class UserProfile {
  String id;
  final String name;
  final String surname;
  final double age;

  UserProfile({
    this.id = '',
    required this.name,
    required this.surname,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Surname": surname,
      "Age": age,
    };
  }

  static UserProfile fromJson(Map<String, dynamic> json) =>
      UserProfile(
        name: json['Name'] as String,
        surname: json['Surname'] as String,
        age: json['Age'] as double,
      );
}


Future createUser(UserProfile user) async {
  final docUser = FirebaseFirestore.instance.collection('User(s)').doc();
  user.id = docUser.id;

  final json = user.toJson();
  await docUser.set(json);
}

Future updateUser(UserProfile user) async {
  final docUser = FirebaseFirestore.instance.collection('User(s)').doc();
  user.id = docUser.id;

  await docUser.update({
    'Name': nameController.text,
    'Surname': surnameController.text,
    'Age': age
  });
}