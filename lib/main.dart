import 'package:carapp/homepage.dart';
import 'package:carapp/models/car.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'db/boxes.dart';
void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(CarAdapter());
  boxCar = await Hive.openBox<Car>('carBox');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'jrgh',
     home: HomePage(),
    );
  }
}