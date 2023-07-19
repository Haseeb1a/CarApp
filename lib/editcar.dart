// import 'package:carapp/cardetailpage.dart';
import 'package:carapp/cardetailpage.dart';
import 'package:carapp/db/function.dart';
import 'package:carapp/models/car.dart';
import 'package:flutter/material.dart';
// import 'package:car/models/car.dart';
// import 'package:car/db/data.dart';
// import 'Cardetailpage.dart';

class EditCarPage extends StatefulWidget {
  final Car car;

  EditCarPage({required this.car});

  @override
  _EditCarPageState createState() => _EditCarPageState();
}

class _EditCarPageState extends State<EditCarPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.car.name;
    modelController.text = widget.car.model.toString();
    colorController.text = widget.car.color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car'),
         backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: modelController,
              decoration: InputDecoration(
                labelText: 'Model',
              ),
            ),
            TextField(
              controller: colorController,
              decoration: InputDecoration(
                labelText: 'Color',
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              color:Color.fromARGB(255, 238, 255, 0),
              onPressed: () {
                final updatedCar = Car(
                  image: widget.car.image,
                  name: nameController.text,
                  model: int.parse(modelController.text),
                  color: colorController.text,
                  
                );

                Carfunction().updateCar(updatedCar); // Update the car in Hive

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarDetailPagee(car: updatedCar)),
                );
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
       backgroundColor: Color.fromARGB(255, 250, 245, 255),
    );
  }
}