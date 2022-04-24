import 'package:flutter/material.dart';

class PBLogger{
  static final PBLogger _logger = PBLogger._internal();
  factory PBLogger() {
    return _logger;
  }
  PBLogger._internal();

  static const String defaultPlaceCode = "PrayerBoard";

  log(String message, { placeCode = defaultPlaceCode }){
    debugPrint("[$placeCode] $message");
  }

  logException(Object exception, { placeCode = defaultPlaceCode }){
    debugPrint("[$placeCode] $exception");
  }
}