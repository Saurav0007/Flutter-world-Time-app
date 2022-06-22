// for api calling package
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
// for convert json data
import 'dart:convert';
// for date and string formatting
import 'package:intl/intl.dart';

// ignore: camel_case_types
class worldTime {
  String? location; // location name for the ui
  String? time; // the time in that location
  String? flag; // this url is going to be an asset for flag image
  String? url; // location url for api endpoint
  bool? isDaytime; // checking if the time in region is day or night

// constructor
  worldTime({this.url, this.flag, this.location});
  // have to use async for api
  Future<void> getTime() async {
    try {
      // get original time api data
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from time api (map time)

      String offset = data['utc_offset'].substring(1, 3);
      String datetime = data['datetime'];

      // print(timezone);
      // print(offset);
      // print(datetime);

      // Create Datetime Object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      // set time value from api
      time = DateFormat.jm().format(now);
    } catch (e) {
      debugPrint("here is the error $e");
    }
  }
}
