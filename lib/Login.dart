import 'package:flutter/material.dart';
import 'package:visite/Sign_up.dart';
import 'package:visite/welcome.dart';

import 'package:visite/Background.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget> [
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(                    
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const Welcome_page()));},
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      child: const Icon(Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                      ),
                    

                    )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: const Text('Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)
                    ),
                    ),

                  const SizedBox(
                    height: 60,
                  ),
                  
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "Email"),
                      inputFile(label: "Password", obscureText: true)
                    ],
                  ),
                ),

                

                Container(
                  padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                  child: MaterialButton(
                    child: Text('Login',
                    style: TextStyle(color: Colors.white),),
                    
                    
                        minWidth: double.infinity,
                        height: 45,
                        
                        onPressed: () {},
                        color: Colors.black.withOpacity(0.3),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                        
                          borderRadius: BorderRadius.circular(20),


                        ),

                ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    
                  )),
                  GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_up()));} ,
                    child: Text('Sign Up',
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    
                  )),
                  )
                  ],
                )
                
                
                        ],
                      ),
                    )
                  
          ),
        ),
  
                      ],
                    
                  
                
              
            
      
    );
        
      
    
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color:Colors.white
        ),

      ),
      const SizedBox(
        height: 10,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
                
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                  
                  //borderSide: BorderSide(color: Color(0xFF1C1B33),
                  //width: 20,),
                    borderRadius: BorderRadius.circular(20)
                    )),
        
      ),
      const SizedBox(height: 30,)
    ],
  );
}





/*import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/stars.png'),
            fit: BoxFit.cover)
          ),
        ),
        

      ),
    );
  }
}*/