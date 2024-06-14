import 'package:flutter/material.dart';
import 'dart:convert';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  Object? parameters;
  @override
  Widget build(BuildContext context) {

    parameters = ModalRoute.of(context)!.settings.arguments;
     data =data.isNotEmpty?data: jsonDecode(jsonEncode(parameters));


     // This is going to return a map of data

    String bgImage= data['isDayTime']?"DAY.png.jpg":"NIGHT.png.jpg";
    Color? bgcolor = data['isDayTime']?Colors.blue[500]:Colors.indigo;
     return Scaffold(

       backgroundColor: bgcolor,
      body:SafeArea(
      child:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0.0, 0.0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data= {
                       'time': result['time'],
                       'location': result['location'],
                       'isDayTime': result['isDayTime'],


                     };
                   });

                  },
                  icon: Icon(
                      Icons.edit_location,
                     color: Colors.blue,
                  ),
                  label: Text('Edit Location'
                  ,style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
        
        
                      )
        
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66.0,
                  )
                ),

              ],
            ),
          ),
        ),
      ),
          )
    );
  }
}
