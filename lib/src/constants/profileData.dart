//Gender
import 'package:flutter/cupertino.dart';

enum Gender {
  male,
  female,
  unknown,
}
Gender? gender = Gender.unknown;
//Age
double age = 18;

//Name Surname
TextEditingController nameController = TextEditingController();
TextEditingController surnameController = TextEditingController();

@override
void dispose() {
  nameController.dispose();
  surnameController.dispose();
  dispose();
}
