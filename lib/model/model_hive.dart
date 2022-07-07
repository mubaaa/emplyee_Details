import 'package:hive/hive.dart';
part 'model_hive.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String username;

  @HiveField(3)
  String email;

  @HiveField(4)
  String profleImage;

  @HiveField(5)
  Addres address;

  @HiveField(6)
  String phone;

  @HiveField(7)
  String website;

  @HiveField(8)
  Cmpany company;

  UserModel(
      {this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.profleImage,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});
}

@HiveType(typeId: 1)
class Addres {
  @HiveField(0)
  String street;

  @HiveField(1)
  String suite;

  @HiveField(2)
  String city;

  @HiveField(3)
  String zipcode;

  @HiveField(4)
  Geoo geo;

  Addres(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});
}

@HiveType(typeId: 2)
class Geoo {
  @HiveField(0)
  String lat;

  @HiveField(1)
  String lng;

  Geoo({required this.lat, required this.lng});
}

@HiveType(typeId: 3)
class Cmpany {
  @HiveField(0)
  String name;

  @HiveField(1)
  String catchPhrase;

  @HiveField(2)
  String bs;

  Cmpany({required this.name, required this.catchPhrase, required this.bs});
}
