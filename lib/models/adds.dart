import 'package:flutter/material.dart';
import 'package:minimal_markt/models/adds_class.dart';

class Adds extends ChangeNotifier {
  final List<AddsClass> _adds = [
    //add 1
    AddsClass(
      name: '1',
      imagePath: 'assets/ads/5.jpeg',
    ),

     //add 2
    AddsClass(
      name: '2',
      imagePath: 'assets/ads/6.png',
    ),

     //add 3
    AddsClass(
      name: '3',
      imagePath: 'assets/ads/7.jpeg',
    ),

     //add 4
    AddsClass(
      name: '4',
      imagePath: 'assets/ads/8.jpeg',
    ),
  ];
  
  int myCurrentIndex = 0;

  //user cart

  final List<AddsClass>_cart = [];

  //get product list

  List<AddsClass> get adds => _adds;

  //get user cart

  List<AddsClass> get cart => _cart;
}
