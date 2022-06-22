import 'package:flutter/material.dart';
import 'package:world_time_app/custom_class/world_time.dart';

// ignore: camel_case_types
class chooseLocation extends StatefulWidget {
  const chooseLocation({Key? key}) : super(key: key);

  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

// ignore: camel_case_types
class _chooseLocationState extends State<chooseLocation> {
  List<worldTime> locations = [
    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    worldTime newInstance = locations[index];
    await newInstance.getTime();
    // navigate to home screnn
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'location': newInstance.location,
      'flag': newInstance.flag,
      'time': newInstance.time,
      'isDaytime': newInstance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                    '${locations[index].location}',
                  ),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('asset/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
