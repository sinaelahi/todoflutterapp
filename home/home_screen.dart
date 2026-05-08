import 'package:flutter/material.dart';
import 'package:sahand/sabri/todoflutterapp/timer/timerscreen.dart';

class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text("Hosgeldin sinanin programina"),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Timerscreen()));
                },
                child: Text("BURAYA BASMA")
            )

          ],
        )
      )
    );
  }

}