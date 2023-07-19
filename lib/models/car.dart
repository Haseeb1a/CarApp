import 'package:hive/hive.dart';

part 'car.g.dart';

@HiveType(typeId: 1)
class Car {
  Car(
      {required this.name,
      required this.model,
      required this.color,
      required this.image});
  @HiveField(0)
  String name;

  @HiveField(1)
  int model;

  @HiveField(2)
  String color;

  @HiveField(3)
  dynamic image;
}