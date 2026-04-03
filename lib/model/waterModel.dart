import 'package:flutter/foundation.dart';

class Watermodel {
  final String? id;

  final double amount;

  final String unit;

  final DateTime dateTime;

  Watermodel({
    this.id,
    required this.amount,
    required this.unit,
    required this.dateTime,
  });
// fetching data from firebase

  factory Watermodel.fromJson(Map<String, dynamic> json , String  id ) {
    return Watermodel(
      id: id,
      amount: json['amount'],
      unit: json['unit'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }




//convert watermodel to json in order to send the data into the firebase

Map<String , dynamic> toJson() {
    return {
      'id' : id,
      'amount' : amount ,
      'unit' : unit ,
      'dataTime' : DateTime.now(),
    };
}

}

