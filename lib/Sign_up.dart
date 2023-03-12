import 'package:flutter/material.dart';
import 'package:visite/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:visite/Background.dart';
import 'package:visite/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sign_up extends StatefulWidget {
  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final _auth=FirebaseAuth.instance;

  //string to display error message
  String? errormessage;

  // our form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  TextEditingController _emailcontroller=TextEditingController();

  TextEditingController _passcontroller=TextEditingController();

  TextEditingController _confirmcontroller=TextEditingController();

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
                    child: const Text('Sign Up',
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
                      inputFile(label:"Email",obscureText: false, controller: _emailcontroller,
                       validator: (value) {
                       if (value!.isEmpty) {
                       return ("Please Enter Your Email");
                       }
                        // reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                      return ("Please Enter a valid email");
                       }
                      return null;
                      },),


                      inputFile(label:"Password",obscureText: true,controller:_passcontroller,
                      validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                      return ("Password is required for login");
                      }
                      if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 6 Character)");
                       }
                       },),
                      inputFile(label:"Confirm Password",obscureText: true,controller:_confirmcontroller,
                      validator: (value) {
                      if (_confirmcontroller.text != _passcontroller.text) {
                      return "Password don't match";
                       }
                      return null;
                      },)
                    ],
                  ),
                ),

                

                Container(
                  padding: const EdgeInsets.fromLTRB(120, 0, 120, 0),
                  child: MaterialButton(
                    child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white),),
                    
                    
                        minWidth: double.infinity,
                        height: 45,
                        
                        onPressed: () {
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailcontroller.text , password: _passcontroller.text, ).then((value) {Navigator.push(context, MaterialPageRoute(builder: (context)=>const Welcome_page()));
                            
                            }).onError((error, stackTrace) {print("error ${error.toString()}");
                            });
                        },
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
                    Text('Already have an account ?',
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    
                  )),
                  GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));} ,
                    child: Text('Login',
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
Widget inputFile({label ,obscureText:false,required TextEditingController controller,validator})
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





