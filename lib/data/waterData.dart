import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:untitled/model/waterModel.dart';


class Waterdata extends ChangeNotifier {
  List<Watermodel> WaterListProvider = [];

  void AddWater(Watermodel water) async {
    var url = Uri.https(
        "water-intake-fdba7-default-rtdb.firebaseio.com", "water.json");
    var restults = await http.post(url, headers: {
      "Content-Type": "application/json",


    },
        body: json.encode({
          "amount": double.parse(water.amount.toString()),
          "unit": "ml",
          "dateTime": DateTime.now().toIso8601String()
        }));

  }
    Future<List<Watermodel>> getwatermodel() async {
      var url = Uri.https(
          "water-intake-fdba7-default-rtdb.firebaseio.com", "water.json");
      var results = await http.get(url);
      print("this is the result of the api $results");
      if (results.statusCode == 200 && results.body != 'null') {
        var extractData = json.decode(results.body) as Map<String, dynamic>;

        WaterListProvider.clear();
        for (var items in extractData.entries) {
          print("this is the items $items");
          WaterListProvider.add(Watermodel(
              amount: (items.value['amount'] as num).toDouble(),
              dateTime: DateTime.parse(items.value['dateTime']),
              unit: items.value['unit']),


          );
        };

      };

      notifyListeners();
      return WaterListProvider;

    }

  }
