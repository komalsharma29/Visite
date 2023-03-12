import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:visite/welcome.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,  
   
      home: Main() 
      
            
      );
    
    
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State <Main> createState() =>  MainState();
}

class  MainState extends State <Main> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Welcome_page()))

    );
  }

 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor:Color(0xFF612FAB),
        
        body: Center(
          
          child: Image(image: AssetImage('assets/logo.png'))
        )

        );
  }
}
