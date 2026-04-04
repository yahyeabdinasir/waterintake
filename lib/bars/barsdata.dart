import 'package:untitled/bars/individualbars.dart';

class Barsdata {
  final double SunWaterAmount;

  final double monWaterAmount;

  final double tuesWaterAmount;

  final double wenesdey;

  final double thrusWaterAmount;

  final double friWaterAmount;
  final double saturWaterAmount;

  Barsdata({
    required this.SunWaterAmount,
    required this.monWaterAmount,
    required this.tuesWaterAmount,
    required this.wenesdey,
    required this.thrusWaterAmount,
    required this.friWaterAmount,
    required this.saturWaterAmount,
  });

  List<Individualbars> BarsList = [];

  void InitialiseBarData() {
    BarsList = [
      Individualbars(x: 0, y: SunWaterAmount),
      Individualbars(x: 1, y: monWaterAmount),
      Individualbars(x: 2, y: tuesWaterAmount),
      Individualbars(x: 3, y: wenesdey),
      Individualbars(x: 4, y: thrusWaterAmount),
      Individualbars(x: 5, y: friWaterAmount),
      Individualbars(x: 6, y: saturWaterAmount),
    ];
  }
}
