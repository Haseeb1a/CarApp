import 'dart:io';
import 'package:carapp/cardetailpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'Cardetailpage.dart';
import 'db/function.dart';
// 
import 'models/car.dart';

class AddCar extends StatefulWidget {
  @override
  _AddcarState createState() => _AddcarState();
}

class _AddcarState extends State<AddCar> {
  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final Carfunction carfunction = Carfunction();
  

  // images function
  final ImagePicker imagePicker = ImagePicker();
  PickedFile? pickedImage;

  Future<void> _pickImage() async {
    final picked = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = picked as PickedFile?;
    });
  }
//  getcam() async {
//     var img = await Image.picke(source: ImageSource.gallery);
//     Navigator.pop(context, img);
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.yellow,
        title: Text('Add Car',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
             color:Color.fromARGB(255, 142, 98, 139),
              onPressed: _pickImage,
              child: Icon(Icons.camera),
            ),
            pickedImage != null
                ? Image.file(
                    File(pickedImage!.path),
                    width: 100,
                    height: 100,
                  )
                : Container(),
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
             color:Color.fromARGB(255, 0, 0, 0),
              onPressed: () {
                final Car newCar = Car(
                  image: pickedImage?.path ?? '',
                  name: nameController.text,
                  model: int.parse(modelController.text),
                  color: colorController.text,
                );

                carfunction.addCar(newCar);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarDetailPagee(car: newCar)),
                );
              },
              child: Text('Save',style: TextStyle(color:Colors.white ),),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}