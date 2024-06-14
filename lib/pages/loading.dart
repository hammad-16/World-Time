import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime obj = WorldTime(location:'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
     await obj.getTime();
     Navigator.pushReplacementNamed(context, '/home', arguments:
     {
       'location': obj.location,
       'flag': obj.flag,
       'time': obj.time,
       'isDayTime': obj.isDayTime,
     });

  }

  @override
  void initState()
  {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: SpinKitWave(
              color: Colors.yellow,
              size: 50.0,
            ),
        ),
    );
  }
}
