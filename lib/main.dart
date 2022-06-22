import 'package:flutter/material.dart';
import 'package:world_time_app/pages/current_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/location',
  routes: {
    '/':(context) => const loading(),
    '/home':(context) => const home(),
    '/location' :(context) => const chooseLocation(),
  },
));
