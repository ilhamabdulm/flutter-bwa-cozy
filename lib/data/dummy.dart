import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/models/space.dart';

List listOfCity = [
  City(image: 'assets/images/cozy-city-1.png', name: 'Jakarta'),
  City(
      image: 'assets/images/cozy-city-2.png', name: 'Bandung', isPopular: true),
  City(image: 'assets/images/cozy-city-3.png', name: 'Surabaya'),
];

List listOfSpace = [
  Space(
      image: 'assets/images/cozy-space-1.png',
      name: 'Kuretakeso Hott',
      price: 52,
      location: 'Bandung, Germany',
      rating: '4/5'),
  Space(
      image: 'assets/images/cozy-space-2.png',
      name: 'Roemah Nenek',
      price: 11,
      location: 'Seattle, Bogor',
      rating: '5/5'),
  Space(
      image: 'assets/images/cozy-space-1.png',
      name: 'Darrling How',
      price: 20,
      location: 'Jakarta, Indonesia',
      rating: '3/5')
];