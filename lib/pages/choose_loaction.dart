import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLoaction extends StatefulWidget {
  @override
  _ChooseLoactionState createState() => _ChooseLoactionState();
}

class _ChooseLoactionState extends State<ChooseLoaction> {
  @override
  void initState() {
    super.initState();
  }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'london.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'london.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'london.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'london.jpg'),
    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'london.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'london.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'london.jpg'),
  ];

  void updateTime(index) async
  {
      WorldTime instance = locations[index];
      await instance.getTime();
      //navigate to home screen
      Navigator.pop(context, {
        "location": instance.location,
        "flag": instance.flag,
        "time": instance.time,
        "isDayTime": instance.isDayTime
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )

    );
  }
}



