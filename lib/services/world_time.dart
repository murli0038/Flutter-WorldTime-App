import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime
{
  String location;  //location name for the ui
  String time;      //the time in that location
  String flag;      //url to an asset flag icon
  String url;       //location url for api endpoint
  bool isDayTime;   //true or false if daytime or not


  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try
        {

          Response responce =
          await get("http://worldtimeapi.org/api/timezone/$url");
          Map myData = jsonDecode(responce.body);
          // print(myData);
          String dateTime = myData["datetime"];
          String offset = myData["utc_offset"].substring(1, 3);

          // print(dateTime);
          // print(offset);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time
          isDayTime = now.hour > 6 && now.hour < 10 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Oops! Could not get time !!";
    }
  }
}
