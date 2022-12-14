import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Position _currentPosition = Position();
  String _currentAddress = "";
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: RaisedButton(
          onPressed: () async {
            final position = await _geolocatorPlatform
                .getCurrentPosition()
                .then((Position position) {
              setState(() {
                _currentPosition = position;
              });
              //_getAddressFromLatLng();
            }).catchError((e) {
              print(e);
            });
            print(_currentPosition.latitude + _currentPosition.longitude);
          },
          child: Text("Location"),
        )),
      ),
    );
  }
}
