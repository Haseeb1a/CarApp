import 'dart:io';
// import 'package:car/searchfunction.dart';
import 'package:carapp/Additaem.dart';
import 'package:carapp/cardetailpage.dart';
import 'package:carapp/searchfuction.dart';
import 'package:flutter/material.dart';
// import 'AddCar.dart';
// import 'Cardetailpage.dart';
import 'db/function.dart';
import 'editcar.dart';
import 'models/car.dart';
// import 'package:carapp/cardetailpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Carfunction carfunction = Carfunction();
  List<Car> cars = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    cars = carfunction.getAllCar();
  }

  void searchCars(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  List<Car> filterCars() {
    return cars.where((car) {
      final nameLower = car.name.toLowerCase();
      final queryLower = searchQuery.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Car> filteredCars = filterCars();

    return Scaffold(
      appBar: AppBar(
        title: Text("carKartH",style: TextStyle(color: Colors.black),),
       backgroundColor: Color.fromARGB(255, 242, 255, 0),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () async {
              final query = await showSearch<String>(
                context: context,
                delegate: CarSearchDelegate(cars, searchCars),
              );
              if (query != null) {
                searchCars(query);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredCars.length,
        itemBuilder: (context, index) {
          final Car car = filteredCars[index];

          return Container(
            height: 70,
            child: Card(
              elevation: 10,
              color: Color.fromARGB(255, 222, 222, 222),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.8,
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  backgroundImage:
                      car.image != null ? FileImage(File(car.image)) : null,
                  child: car.image == null ? Icon(Icons.image, size: 30) : null,
                ),
                title: Text(car.name),
                subtitle: Text(car.color),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCarPage(car: car)),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      color: Color.fromARGB(255, 196, 0, 0),
                      onPressed: () {
                                    int carIndex = cars.indexOf(car);
                                    carfunction.deleteCar(carIndex);
                                    // Navigator.pop(context);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarDetailPagee(car: car)),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCar(),)
            // MaterialPageRoute(builder: (context) => Addcar()),
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}