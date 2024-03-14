import 'user.dart';
import 'dart:io';

class Profile {
  String name;
  int age;
  String email;
  List<String> cars;

  Profile(this.name, this.age, this.email, this.cars);

  static Profile createProfile() {
    String name;
    do {
      print("Enter name (minimum 2 characters):");
      name = stdin.readLineSync()!;
    } while (name.length < 2);

    int age;
    do {
      print("Enter age (minimum 18 years):");
      age = int.parse(stdin.readLineSync()!);
    } while (age < 18);

    String email;
    do {
      print("Enter email (e.g., sample@gmail.com):");
      email = stdin.readLineSync()!;
    } while (!isValidEmail(email));

    return Profile(name, age, email, []);
  }

  static bool isValidEmail(String email) {
    // Simple email validation using a regular expression
    RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  static void showProfile(User user) {
    print("Name: ${user.profile.name}");
    print("Age: ${user.profile.age}");
    print("Email: ${user.profile.email}");
  }
}
