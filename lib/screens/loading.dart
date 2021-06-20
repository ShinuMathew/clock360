import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:clock360/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorlTime() async {
    WorldTime instance = WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    print("Preparing for sending request to world time api");
    await instance.getTime();
    // Navigator.pushNamed(context, '/home');  //  Pushes the home route on top of loading route
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    }); //  Replaces the route underneath.
        //  arguments : is used to pass the arguments from Loading widget to Home
  }

  @override
  void initState() {
    setUpWorlTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Center(
        child: SpinKitDoubleBounce (
          color: Colors.white,
          size: 150.0,
        ),
      )
    );
  }

/*
* Not required - Deprecated methods
* */
  @deprecated
  void getData() async {
    var url = Uri.parse('http://worldtimeapi.org/api/timezone/Indian/Christmas');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
  }

  @deprecated
  void getTime() async {
    //  Get the timeZone data from worldtimeapi
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
    //  Convert response to Map data
    Map data = jsonDecode(response.body);
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //  Convert the dateTime string to DateTime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
  }

}
