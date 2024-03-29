import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    this.data = this.data.isNotEmpty ? this.data : ModalRoute.of(context).settings.arguments;
    print(data);

    //  Set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover
                )
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(
                  children: [
                    FlatButton.icon(
                        onPressed: () async {
                          dynamic result  = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time' : result['time'],
                              'location' : result['location'],
                              'isDayTime' : result['isDayTime'],
                              'flag' : result['flag']
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location,
                          color: Colors.grey[400],),
                        label: Text("Change Location",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),),

                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}