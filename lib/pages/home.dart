import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  Map datas = {};
  @override
  Widget build(BuildContext context) {
    datas = datas.isNotEmpty ? datas : ModalRoute.of(context)!.settings.arguments as Map;

    String? bgImage = datas['isDaytime'] != null && datas['isDaytime'] ==true ? 'day.png' : 'night.png';
    Color? bgColor = datas['isDaytime'] ? Colors.lightBlue : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      // for moving the text from up to down a bit
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('asset/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async { 
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      datas = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag' : result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[200],
                  ),
                  label: const Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      datas['location'],
                      style: const TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  datas['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
