import 'package:flutter/material.dart';
import 'package:new_world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'southafrica.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
  ];

  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Text('Choose a Location', style: TextStyle(color: Colors.white) ,),
        centerTitle: true,
        elevation: 0,

      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0, horizontal:4.0),
            child: Card(
              child:ListTile(
                onTap: (){
                  updateTime(index);

                },
                title: Text(locations[index].location),
                leading:CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ) ,
              )
            ),
          );
        }
      )
    );
  }
}
