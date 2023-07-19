import 'dart:io';

// import 'package:car/models/car.dart';
import 'package:carapp/models/car.dart';

import 'package:flutter/material.dart';

class CarDetailPagee extends StatelessWidget {
  final Car car;

  CarDetailPagee({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Car Kart',style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Container(
          height: 400,
          child: Card(
            color:Color.fromARGB(255, 78, 76, 78),
            elevation: 30,
            shadowColor: Color.fromARGB(255, 203, 203, 0),
            child: Card(
              color: Color.fromARGB(255, 255, 255, 255),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 25,
              shadowColor: Color.fromARGB(255, 185, 34, 255),
              margin: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100.0,
                      backgroundColor: Colors.black,
                      backgroundImage:
                          car.image != null ? FileImage(File(car.image)) : null,
                      child: car.image == null
                          ? Icon(Icons.image, size: 30)
                          : null,
                    ),
                    SizedBox(height: 20),
                    Text('Name: ${car.name}',style:TextStyle(fontSize: 20),),
                    Text('Model: ${car.model}',style: TextStyle(fontSize: 20 ),),
                    Text('Color: ${car.color}',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}