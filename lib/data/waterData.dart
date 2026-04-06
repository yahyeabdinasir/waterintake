import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/model/waterModel.dart';
import 'dart:convert';


class Waterdata extends ChangeNotifier {
  List<Watermodel> WaterListProvider = [];

  void AddWater(Watermodel water) async {
    var url = Uri.https(
        "water-intake-fdba7-default-rtdb.firebaseio.com", "water.json");
    var restults = await http.post(url, headers: {
      "Content-Type": "application/json",


    },
        body: json.encode({
          "water": double.parse(water.amount.toString()),
          "unit": "ml",
          "time": DateTime.now().toIso8601String()
        }));



    Future<List<Watermodel>> Getwatermodel() async {
      var url = Uri.https("water-intake-fdba7-default-rtdb.firebaseio.com" , "water.json");
      var results = await http.get(url);
      if (results.statusCode == 200 && results.body != 'null') {
        var extractData = json.decode(results.body) as Map<String, dynamic>;

        for (var items in extractData.entries) {
          WaterListProvider.add(Watermodel(
              amount: items.value['amount'],
              dateTime: DateTime.parse(items.value['dateTime']),
              unit: items.value['unit']),

          );
        };
      };

      notifyListeners();
      return WaterListProvider;
    }

  return   WaterListProvider;
}