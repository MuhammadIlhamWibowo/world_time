import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'berlin.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'berlin.jpg', url: 'Europe/London'),
    WorldTime(location: 'Cairo', flag: 'berlin.jpg', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'berlin.jpg', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'berlin.jpg', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'berlin.jpg', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'berlin.jpg', url: 'Asia/Seoul'),
    WorldTime(location: 'Indonesia', flag: 'berlin.jpg', url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          'Choose a Location',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                elevation: 1.5,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          }),
    );
  }
}
