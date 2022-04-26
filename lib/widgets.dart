import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double getheight(context, value) {
  return MediaQuery.of(context).size.height * (value / 1184);
}

double getwidth(context, value) {
  return MediaQuery.of(context).size.width * (value / 832);
}
