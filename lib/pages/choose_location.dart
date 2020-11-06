import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Lagos, Nigeria', flag: 'ng.jpg', url: 'Africa/Lagos'),
    WorldTime(location: 'New York', flag: 'america.png', url: 'America/New_York'),
    WorldTime(location: 'London', flag: 'london.jpg', url: 'Europe/London'),
    WorldTime(location: 'Athens', flag: 'athens.png', url: 'Europe/Athens'),
    WorldTime(location: 'Oral', flag: 'oral.png', url: 'Asia/Oral'),
    WorldTime(location: 'Qatar', flag: 'qatar.jpg', url: 'Asia/Qatar'),
    WorldTime(location: 'Los Angeles', flag: 'los_angeles.png', url: 'America/Los_Angeles'),
    WorldTime(location: 'Sydney', flag: 'sydney.jpg', url: 'Australia/Sydney'),
    WorldTime(location: 'Singapore', flag: 'singapore.jpg', url: 'Asia/Singapore'),
    WorldTime(location: 'Swift Current, Canada', flag: 'canada.jpg', url: 'America/Swift_Current')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  bool isFlagAvailable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text(
          'Choose Location',
          style: TextStyle(
              fontFamily: 'Delius',
              letterSpacing: 2.0
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    fontFamily: 'Delius',
                    letterSpacing: 2.0
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
