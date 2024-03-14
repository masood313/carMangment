import 'dart:io';
import 'user.dart';

class Dashboard {
  static List<String> cars = [];

  static void addCar(User user) {
    print("Enter car name:");
    String carName = stdin.readLineSync()!;
    user.profile.cars.add(carName);
    print("Car added successfully!");
  }

  static void showCars(User user) {
    print("Cars:");
    for (var car in user.profile.cars) {
      print(car);
    }
  }
}
