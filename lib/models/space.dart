class Space {
  int id = 0;
  String name = '';
  String imageUrl = '';
  int price = 0;
  String city = '';
  String country = '';
  int rating = 0;
  String address = '';
  String phone = '';
  String mapUrl = '';
  List photos = const [];
  int numberOfKitchens = 0;
  int numberOfBedrooms = 0;
  int numberOfCupboards = 0;

  Space({
    this.id = 0,
    this.name = '',
    this.imageUrl = '',
    this.city = '',
    this.country = '',
    this.price = 0,
    this.rating = 0,
    this.address = '',
    this.phone = '',
    this.mapUrl = '',
    this.photos = const [],
    this.numberOfKitchens = 0,
    this.numberOfBedrooms = 0,
    this.numberOfCupboards = 0,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    imageUrl = json['image_url'];
    city = json['city'];
    country = json['country'];
    price = json['price'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }
}
