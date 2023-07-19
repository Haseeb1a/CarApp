import 'package:carapp/models/car.dart';
import 'package:hive/hive.dart';
// import 'package:car/models/car.dart';

class Carfunction {
  final Box<Car> _carBox = Hive.box<Car>('carbox');

  List<Car> getAllCar() {
    return _carBox.values.toList();
  }

  void addCar(Car car) {
    _carBox.add(car);
  }

  void updateCar(Car updatedCar) {
    final car = updatedCar;
    final carIndex = _carBox.values.toList().indexWhere((car) => car == car);
    if (carIndex != -1) {
      _carBox.putAt(carIndex, updatedCar);
    } else {
      print('$car');
    }
  }

  void deleteCar(int index) {
    _carBox.deleteAt(index);
  }
}