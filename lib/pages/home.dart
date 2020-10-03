import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{

  Map data = {};

  @override
  Widget build(BuildContext context)
  {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data["isDayTime"] ? "day.jpeg" : "night.jpeg";
    Color bgColor = data["isDayTime"] ? Colors.blueAccent : Colors.black38;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Scaffold(
                    body: SafeArea(

                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/$bgImage'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                          child: Column(
                            children: <Widget>[
                              FlatButton.icon(
                                onPressed: () async {
                                 dynamic result = await Navigator.pushNamed(context, '/chooseLocation');
                                 setState(() {
                                   data = {
                                     "time": result["time"],
                                     "location": result["location"],
                                     "isDayTime": result["isDayTime"],
                                     "flag": result["flag"]
                                   };
                                 });
                                },
                                icon: Icon(
                                    Icons.edit_location,
                                  color: Colors.red,
                                ),
                                label: Text("Edit Location",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(data["location"],
                                  style: TextStyle(
                                    fontSize: 28,
                                    letterSpacing: 2.0
                                  ),),

                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                data["time"],
                                style: TextStyle(
                                  fontSize: 60
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: bgColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
