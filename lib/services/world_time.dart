import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime
{
   String location="";
   String time="";
   String flag="";//url to an asset flag icon
   String url=""; //location url for an api endpoint
   bool isDayTime=false;// according to if it is day time or not

   WorldTime({required this.location , required this.flag, required this.url}) {

   }



  Future <void> getTime() async {
     try {
       //making the request
       Response response = await get(
           Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
       Map data = jsonDecode(response.body);

       String datetime = data['datetime'];
       String offset = data['utc_offset'].substring(1, 3);
       //Creating a DateTime object
       DateTime now = DateTime.parse(
           datetime); //now is a variable, DateTime object
       now = now.add(Duration(hours: int.parse(offset)));
       isDayTime= now.hour>6 && now.hour<20?true:false;

       time = DateFormat.jm().format(now);
     }
     catch(e)
    {
      print('Caught error: $e');
      time= 'could not get time data';
    }
   }

}
//Creating an instance of class

