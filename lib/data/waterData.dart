import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:untitled/model/waterModel.dart';

class Waterdata extends ChangeNotifier {
  List<Watermodel> WaterListProvider = [];

  void AddWater(Watermodel water) async {
    var url = Uri.https(
      "water-intake-fdba7-default-rtdb.firebaseio.com",
      "water.json",
    );
    var results = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "amount": double.parse(water.amount.toString()),
        "unit": "ml",
        "dateTime": DateTime.now().toIso8601String(),
      }),
    );

    if (results.statusCode == 200) {
      final extrectedData = jsonDecode(results.body) as Map<String, dynamic>;
      {

          WaterListProvider.add(
            Watermodel(
              id: extrectedData['name'],
              amount: water.amount,
              unit: water.unit,
              dateTime: water.dateTime,
            ),
          );

        }


      ;
    } else {
      print("error accured ");
    }

    notifyListeners();
  }

  Future<List<Watermodel>> getwatermodel() async {
    var url = Uri.https(
      "water-intake-fdba7-default-rtdb.firebaseio.com",
      "water.json",
    );
    var results = await http.get(url);
    print("this is the result of the api $results");
    if (results.statusCode == 200 && results.body != 'null') {
      var extractData = json.decode(results.body) as Map<String, dynamic>;
      print("this si the result from the firebase ${extractData}");

      WaterListProvider.clear();
      for (var items in extractData.entries) {
        print("this is the items $items");
        WaterListProvider.add(
          Watermodel(
            id: items.key,
            amount: (items.value['amount'] as num).toDouble(),
            dateTime: DateTime.parse(items.value['dateTime']),
            unit: items.value['unit'],
          ),
        );
      }
    }

    notifyListeners();
    return WaterListProvider;
  }

  void delete(Watermodel watermodel) async {
    var url = Uri.https(
      "water-intake-fdba7-default-rtdb.firebaseio.com",
      "water/${watermodel.id}.json",
      
    );
    print("Deleting ID: ${watermodel.id}");
    final response = await http.delete(url);
    print("Status code ${response.statusCode}");

    if (response.statusCode == 200) {
      WaterListProvider.removeWhere((element) => element.id == watermodel.id);
      notifyListeners();
    } else {
      print("something went wrong");
    }
  }
}


