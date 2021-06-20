import 'dart:math';

import 'package:clock360/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.jpeg'),
  ];

  void updateTime(index) async {
    await locations[index].getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : locations[index].location,
      'time' : locations[index].time,
      'flag' : locations[index].flag,
      'isDayTime' : locations[index].isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text("Choose a Location"),
        centerTitle: true,
        // elevation: 1,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () async {
                  await updateTime(index);
                },
                title: Text(
                  locations[index].location
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /*
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('build function ran with counter ${counter}');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text("Choose a Location"),
        centerTitle: true,
        // elevation: 1,
      ),
      body: Center(
        child: RaisedButton(
            color: Colors.greenAccent[200],
            child: Text("Count Updated : ${counter}") ,
            onPressed: () => {
              setState(() => {counter += 1})
            }),
      )
    );
  }
*/
  /*
  * void getData() async {
    // Update counter variable after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      print("Reset Counter");
      setState(() => {counter = 0});
    });

    // Simulate network request from username
    String name = await Future.delayed(Duration(seconds: 3), () {
      return "Shinu";
    });

    // Simulate network request from username
    String email = await Future.delayed(Duration(seconds: 2), () {
      return "mathewshinu1234@mail.com";
    });

    print('$name => ${email.contains('@') ? 'valid' : 'invalid' }');
  }

  @override
  void initState() {
    print('init state function ran');
    counter = Random().nextInt(10);
    getData();
  }
*/
}
