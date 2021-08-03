import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'resource/styles.dart';

class Utility {
  static Future<bool> checkNetwork() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  var currentLocation;

  static void showSnackBar(
      {String message, BuildContext scaffoldContext, int miliSec = 1500}) {
    if (scaffoldContext != null)
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: miliSec),
          content: Text(
            message ?? "",
            style: Styles.boldWhite(),
          ),
          backgroundColor: Colors.black.withOpacity(0.7),
        ),
      );
  }

  static String convertDate(
    String serverFormat,
    String date,
    String newFormat, {
    bool isUTC = false,
  }) {
    DateFormat format = DateFormat(serverFormat);
    DateTime time = format.parse(date, isUTC);
    int _miliSecond = time.toLocal().millisecondsSinceEpoch;
    return DateFormat(newFormat).format(
      DateTime.fromMicrosecondsSinceEpoch(_miliSecond * 1000),
    );
  }

  static String convertDateFormat(DateTime date) {
    var formatter = new DateFormat('yyyy-MM-dd HH:mm a');
    String formatted = formatter.format(date);
    return formatted;
  }

  static String convertDateFormatMMDDYYYY(DateTime date) {
    var formatter = new DateFormat("MM.dd.yyyy");
    String formatted = formatter.format(date);
    return formatted;
  }

  static DateTime getDT(
    String serverFormat,
    String date, {
    bool isUTC = false,
  }) {
    DateFormat format = DateFormat(serverFormat);
    DateTime time = format.parse(date, isUTC);
    return time.toLocal();
  }

  static int getDeviceType() {
    if (Platform.isAndroid)
      return 1;
    else
      return 2;
  }

  static Future waitFor(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }

  static Future waitForMili(int mili) async {
    await Future.delayed(Duration(milliseconds: mili));
  }
}
