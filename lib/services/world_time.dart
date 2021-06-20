import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;  //  Location name for the UI
  String time;  //  The time in that location
  String flag;  //  Url to an asset flag icon
  String url;   //  Location url for api endpoint
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      //  Make request to worldtimeapi for $url
      print("Making a GET request to http://worldtimeapi.org/api/timezone/$url");
      Map<String, String> headers = {"Content-Type": "application/json"};
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'), headers : headers);

      //  Convert response to Map data
      print("Received data : ${response.body}");
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //  Convert the dateTime string to DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //  Set the time property
      this.isDayTime = (now.hour > 5 && now.hour < 18) ? true : false;
      this.time = DateFormat.jm().format(now);

    } catch(e) {
        print('caught error $e');
        this.time = 'Could not fetch time. Please try later';
    }
  }

}
