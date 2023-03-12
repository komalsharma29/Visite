import 'package:flutter/material.dart';
import 'package:visite/Login.dart';
import 'package:visite/Sign_up.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({super.key});

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold(
         backgroundColor:Color(0xFF612FAB),
         body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Image(image: AssetImage('assets/background.png'),
              ),
            ),
            
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(15, 2, 5, 2),
              child: const Text('Welcome To ',
              style: TextStyle(
                
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),

            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(15, 2, 5, 2),
              child: const Text('Visite',
              style: TextStyle(
                
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
              children: [
                Container(
                  height: 90,
                  width: 100,
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));                 }, 
                  child: Text('Login',
                  style: TextStyle(
                    fontSize: 15,
                  ),),
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)),
                    side: const BorderSide(
                      width: 0.5,
                      color: Colors.purple,
                    )

                  ),),
                ),

                Container(
                  height: 90,
                  width:100,
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_up()));
                    }, 
                  child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                  ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)),
                    //elevation: 5,
                    side: const BorderSide(
                      width: 0.5,
                      color: Colors.purple,
                    )

                  ),)
                )
                
              ],
            ),
            Container(
              //alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.fromLTRB(4, 100, 4, 0),
              child: const Text('By continuing you agree visite’s terms of \n services and privacy policy.',
              textAlign: TextAlign.center,
              style: TextStyle(
                
                fontSize: 16,
                //fontWeight: FontWeight.bold,
                color: Colors.white
              ),),

            ),

          


              ],
            ),

         ),
       );
  }
}