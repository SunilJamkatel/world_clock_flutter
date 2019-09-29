import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "London", url: "Europe/London", flag: "uk.png"),
    WorldTime(location: "Kathmandu", url: "Asia/Kathmandu", flag: "nepal.png"),
    WorldTime(location: "Monroe", url: "America/Chicago", flag: "usa.jpeg")
  ];

  @override
  Widget build(BuildContext context) {
    print('build state function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () async {
                  WorldTime instance = locations[index];
                  await instance.getTime();
                  Navigator.pop(context, {
                    'location': instance.location,
                    'flag': instance.flag,
                    'time': instance.time,
                    'isDayTime': instance.isDayTime
                  });
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text('${locations[index].location}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
