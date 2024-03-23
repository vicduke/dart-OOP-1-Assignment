import 'dart:io';

// Define an interface
abstract class Vehicle {
  void accelerate();
  void brake();
}

// Base class implementing Vehicle interface
class Car implements Vehicle {
  @override
  void accelerate() {
    print('Car is accelerating.');
  }

  @override
  void brake() {
    print('Car is braking.');
  }
}

// Derived class that overrides an inherited method
class ElectricCar extends Car {
  @override
  void accelerate() {
    print('Electric car is accelerating silently.');
  }
}

// Class that initializes data from a file
class CarFromFile extends Car {
  String make;
  String model;

  CarFromFile(this.make, this.model);

  @override
  String toString() {
    return '$make $model';
  }

  factory CarFromFile.fromFile(String filename) {
    final file = File(filename);
    final lines = file.readAsLinesSync();
    final make = lines[0];
    final model = lines[1];
    return CarFromFile(make, model);
  }
}

void main() {
  // Demonstrating loop
  for (int i = 0; i < 3; i++) {
    print('Loop iteration: $i');
  }

  // Creating an instance of ElectricCar
  ElectricCar electricCar = ElectricCar();
  electricCar.accelerate();
  electricCar.brake();

  // Creating an instance of CarFromFile initialized from a file
  final carFromFile = CarFromFile.fromFile('car_data.txt');
  print('Car loaded from file: $carFromFile');
}
