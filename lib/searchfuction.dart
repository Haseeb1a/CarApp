// import 'package:car/homepage.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'models/car.dart';

class CarSearchDelegate extends SearchDelegate<String> {
  final List<Car> cars;
  final Function(String) onSearch;

  CarSearchDelegate(this.cars, this.onSearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, index) {
        final Car car = cars[index];
        return ListTile(
          title: Text(car.name),
          onTap: () {
          
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final List<Car> suggestionList = cars.where((car) {
      final nameLower = car.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
      
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final Car car = suggestionList[index];
        return ListTile(
          textColor: Color.fromARGB(255, 43, 0, 255),
          title: Text(car.name),
          onTap: () {
            onSearch(car.name);
            close(context, car.name);
          },
        );
      },
    );
    
  }
}