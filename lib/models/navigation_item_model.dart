import 'package:flutter/material.dart';

class NavigationItemModel {
  NavigationItemModel({this.header,this.suffix, required this.label, required this.prefix});

  final IconData? suffix;
  final String label;
  final IconData prefix;
  final String? header;
}