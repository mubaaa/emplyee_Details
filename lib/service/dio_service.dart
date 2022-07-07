import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:employes_data/model/model.dart';
import 'package:employes_data/model/model_hive.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<UserModel>> UserList = ValueNotifier([]);

class DioService {
  List<User?>? user;

  String baseUrl = "http://www.mocky.io/v2/5d565297300000680030a986";

  Future getReq() async {
    // bool fistTime = true;

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final jsonresponse = jsonDecode(response.body);
        for (var element in jsonresponse) {
          user = userFromJson(response.body);
          log("Data comes here${response.body}");
        }
        print(jsonresponse);

        // Geoo geo =
        //     Geoo(lat: user!.address!.geo!.lat, lng: user!.address!.geo!.lng);
        // print(geo.lat);
        // Addres addres = Addres(
        //     street: user!.address!.street!,
        //     suite: user!.address!.suite!,
        //     city: user!.address!.city!,
        //     zipcode: user!.address!.zipcode!,
        //     geo: geo);
        // print(addres.city);
        // Cmpany company = Cmpany(
        //     name: user!.company!.namee!,
        //     catchPhrase: user!.company!.catchPhrase!,
        //     bs: user!.company!.bs!);
        // print(company.name);

        Cmpany cmpany =
            Cmpany(name: "name", catchPhrase: "catchPhrase", bs: "bs");
        List<UserModel> itemList = user!
            .map((e) => UserModel(
                  id: e!.id!,
                  name: e.name!,
                  username: e.username!,
                  email: e.email!,
                  profleImage: e.profileImage ?? "",
                  address: Addres(
                    street: e.address!.street!,
                    suite: e.address!.suite!,
                    city: e.address!.city!,
                    zipcode: e.address!.zipcode!,
                    geo: Geoo(
                      lat: e.address!.geo!.lat,
                      lng: e.address!.geo!.lng,
                    ),
                  ),
                  phone: e.phone ?? "",
                  website: e.website ?? "",
                  company: Cmpany(
                      name: e.company != null ? e.company!.namee! : cmpany.name,
                      catchPhrase: e.company != null
                          ? e.company!.catchPhrase!
                          : cmpany.catchPhrase,
                      bs: e.company != null ? e.company!.bs! : cmpany.bs),
                ))
            .toList();
        List? list = [];
        final userBox = Hive.box<List>("UserDetails");
        try {
          await userBox.put("list", itemList);
          list = userBox.get("list");
        } catch (e) {
          log("error$e");
        }
        UserList.notifyListeners();
        return list;
      }
    } on SocketException {
      print("netwokkkkk errror");
    } on DioError catch (e) {
      print(e.message);
    }
  }
}
