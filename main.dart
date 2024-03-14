import 'dart:io';
import 'user.dart';
import 'profile.dart';
import 'dashboard.dart';

void main() {
  int choice;
  bool isLoggedIn = false;
  User? user; // Initialize user as nullable

  while (true) {
    print("            Welcome            ");
    print("--------------------------------");
    print("1. Login");
    print("2. Signup");
    print("3. Exit");
    print("Enter your choice:");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        isLoggedIn = User.login();
        if (isLoggedIn) {
          user = User.currentUser!;
          print("Login successful!");
        } else {
          print("Login failed. Try again.");
        }
        break;
      case 2:
        User.signup();
        break;
      case 3:
        exit(0);
    }

    if (isLoggedIn) {
      while (true) {
        print("1. Show Profile");
        print("2. Add Car");
        print("3. Show Cars");
        print("4. Logout");
        print("Enter your choice:");
        choice = int.parse(stdin.readLineSync()!);

        switch (choice) {
          case 1:
            if (user != null) {
              // Check if user is not null
              Profile.showProfile(user);
            }
            break;
          case 2:
            if (user != null) {
              Dashboard.addCar(user);
            }
            break;
          case 3:
            if (user != null) {
              Dashboard.showCars(user);
            }
            break;
          case 4:
            isLoggedIn = false;
            user = null;
            print("Logged out successfully.");
            break;
        }

        if (!isLoggedIn) {
          break;
        }
      }
    }
  }
}
