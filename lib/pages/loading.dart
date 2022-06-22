import 'package:flutter/material.dart';
import 'package:world_time_app/custom_class/world_time.dart';
// for importing spinner for loading scrren
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

// ignore: camel_case_types
class _loadingState extends State<loading> {
  /*  // have to use async for api
  void getTime() async {
    Response response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
        // to convert data and decode json format and use those data in future
    Map data = jsonDecode(response.body);
    print(data);
    print(data['userId']);
    */

  void setUpWorldTime() async {
    worldTime newIns =
        worldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'berlin.jpg');
    await newIns.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': newIns.location,
      'flag': newIns.flag,
      'time': newIns.time,
      'isDaytime' : newIns.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
