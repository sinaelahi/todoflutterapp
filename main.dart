import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:persian_fonts/persian_fonts.dart';
class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreen createState() => _WeatherScreen();
}


class _WeatherScreen extends State<WeatherScreen> {
  Color myCustomColor = Color(0xFF1A1B20);
  Color backgroundColor = Color(0xFF4c77a0);
  String temperature = "";
  List<String> Days = ["شنبه","یکشنبه","دوشنبه","سه شنبه","چهارشنبه","پنجشنبه","جمعه"];
  @override
  void initState() {
    fetchWeather();
    super.initState();
  }
  void fetchWeather() async{
    final apikey = '4k4vazsd2j8yiihifcbyaxx9k5r9uuo99ieka6ai';
    final url = Uri.parse('https://www.meteosource.com/api/v1/free/point?place_id=shirvan&sections=current,daily&timezone=auto&language=en&key=$apikey');
    final response = await http.get(url);
    if(!mounted) return;
    if(response.statusCode == 200){
      setState(() {
      final data = json.decode(response.body);
      temperature = data['current']['temperature'].round().toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {

   return Scaffold(
    backgroundColor: myCustomColor,
    body: Stack(
      children:[
         Positioned.fill(
           child: Image.asset(
                   'assets/images/Airbackground.jpg',
                   fit: BoxFit.cover,
                 ),
         ),
         Center(
           child: Padding(
             padding: const EdgeInsets.only(top: 60),
             child: Column(
               children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    height: 183,
                    width: 390,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Shirvan",style: TextStyle(color: Colors.white,fontSize: 35,height: 0.9,),),
                      SizedBox(height: 20),
                      Text("${temperature}°" ?? "خطا در دریافت",style: PersianFonts.Vazir.copyWith(color: Colors.white,fontSize: 70,height: 0.9,)),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mostly Cloudy",style: TextStyle(color: Color(0xFFa79eb7),fontSize: 24,height: 0.9,),),
                          Text("H:24°   L:18°",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
                SizedBox(height: 10),
                 Stack(
                   children:[
                     Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: Image.asset(
                      'assets/images/house.png',
                      
                      width: 390,
                      height: 390,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top: 225),
                     child: ClipRRect(
                       child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
                         child: Container(
                          height: 325,
                          width: 390,
                          decoration: BoxDecoration(
                            
                            gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF543070).withOpacity(0.6), // üst
                              Color(0xFF302756), // alt
                            ],
                          ),
                            borderRadius: BorderRadius.all(Radius.circular(44))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Column(
                          
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25,left: 25,right: 25),
                                  child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Hourly Forecast",style: TextStyle(fontSize: 16,color: Color(0xFFa79eb7),),),
                                      Text("Weekly Forecast",style: TextStyle(fontSize: 16,color: Color(0xFFa79eb7),),),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Color(0xFFa79eb7).withOpacity(0.2),
                                ),
                                SizedBox(height: 10),
                             Padding(
                               padding: const EdgeInsets.only(left: 15,right: 15),
                               child: SizedBox(
                                    height: 146,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Days.length,
                                      separatorBuilder: (context, index) => SizedBox(width: 15),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF302756).withOpacity(0.9),
                                                Color(0xFF543070),
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(right: 8),
                                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Days[index], style: PersianFonts.Vazir.copyWith(fontSize: 16, color: Colors.white)),
                                              Lottie.asset(
                                            'assets/Sunny.json',
                                            width: 50,
                                            height: 50
                                          ),
                                              Text("19°", style: TextStyle(fontSize: 18, color: Colors.white)),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                             ),
             
                              ],
                            ),
                          ),
                         ),
                       ),
                     ),
                   ),
                   
                   ]
                 ),
               ],
             ),
           ),
         ),
      
          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: ClipRRect(
                             
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  height: 88,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF302756),
                              
                                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WeatherScreen()));
                                        },
                                        child: Icon(Icons.home, color: Colors.white)),
                                      Icon(Icons.cloud, color: Colors.white),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                             Positioned(
                      bottom: 88 - 20, 
                      left: MediaQuery.of(context).size.width / 2 - 40,
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFF302756), 
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
      ]
    ),
   );
  }
}
 
