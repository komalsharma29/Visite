import 'package:flutter/material.dart';
import 'package:visite/Login_module/Sign_up.dart';
import 'package:visite/Login_module/forgot_password.dart';
import '../firstpage.dart';
import 'package:visite/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visite/Background.dart';
import 'package:visite/main.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => firstpage()));
  }

  Widget build(BuildContext context) {
    final TextEditingController _emailcontroller = TextEditingController();

    final TextEditingController _passcontroller = TextEditingController();
    void login() async {
      Map<dynamic, dynamic> UserData = {};
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final String email = _emailcontroller.text;
      final String password = _passcontroller.text;

      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (user != null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => firstpage()));
        }

        final DocumentSnapshot snapshot =
            await db.collection('user').doc(user.user!.uid).get();

        final data = snapshot.data();
        //   setState(() {
        //   UserData = data;
        //   UserData['provider'] = 'Email';
        // });
        Navigator.of(context).pushNamed("/home");
      } catch (e) {
        print("error");
        /*showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("$e"),
              );
            });*/

        print(e);
      }
    }

    return Stack(
      children: [
        background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
              child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Welcome_page()));
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(20, 70, 0, 0),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 80, 0, 50),
                  alignment: Alignment.topLeft,
                  child: const Text('Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(222, 255, 255, 255),
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        style: const TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                        controller: _emailcontroller,
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white, // Set the text color to white
                        ),
                        controller: _passcontroller,
                        cursorColor: Colors.white,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(50),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            backgroundColor: Color.fromARGB(207, 32, 35, 61),
                            foregroundColor: Colors.white70),
                        // icon: Icon(Icons.arrow_forward,size:26),
                        child: Text('Login',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center),
                        onPressed: login,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgot(),
                        ));
                  },
                  child: Text('Forgot Password',
                      style: TextStyle(
                        color: Color.fromARGB(255, 211, 210, 210),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 208, 208, 208),
                            fontSize: 15)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sign_up(),
                            ));
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 217, 216, 216),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      ],
    );
  }
}  

/*import 'package:flutter/material.dart';
import 'package:visite/Sign_up.dart';
import 'package:visite/forgot_password.dart';
import 'package:visite/homepage.dart';
import 'package:visite/sign_upwidget.dart';
import 'package:visite/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visite/Background.dart';
import 'package:visite/main.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => home()));
  
  //State<Login> createState() => _LoginState();
}

  Widget build(BuildContext context) {
    final TextEditingController _emailcontroller=TextEditingController();

  final TextEditingController _passcontroller=TextEditingController();
     void login() async {
      Map<dynamic, dynamic> UserData = {};
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final String email = _emailcontroller.text;
      final String password = _passcontroller.text;
      print("email: " + email);
      print("password: " + password);
      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
            if(user!=null)
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => home()));
            }

        final DocumentSnapshot snapshot =
            await db.collection('user').doc(user.user!.uid).get();

        final data = snapshot.data();
        //   setState(() {
        //   UserData = data;
        //   UserData['provider'] = 'Email';
        // });
        Navigator.of(context).pushNamed("/home");

        print(
            '=========================User is Login...=============================');

        
        print("User is Logged");
      } catch (e) {
        print("error");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("$e"),
              );
            });

        print(e);
      }
    }
    return Stack(
    
      children: [
        background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:Form(
            //key:_formKey,
            //child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget> [
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

                  Container(
                   // padding: EdgeInsets.all(10),
                    
                    alignment: Alignment.center,
                    child: const Text('Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)
                    ),
                    ),


                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  
                  child: Column(
                    children: <Widget>
                    [
                  //SizedBox(
                    //height: 20,
                  //),

                  TextField(
                    controller: _emailcontroller,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Email'),
                    
                  ),
                 


                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: _passcontroller,
                    
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Password'),
                    
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(Icons.arrow_forward,size:32),
                  label: Text('Login',
                  style: TextStyle(fontSize: 24),),
                  onPressed: login,
                  ),
                ],             
                  ),
                ),
                GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot(),));} ,
                    child: Text('Forgot Password',
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    
                  )),
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
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_up(),));} ,
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
                  
          //),
        ),
  
                      ],
                    
                  
                
              
            
      
    );
        
   
    

  }

    
    

  }  


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visite/homepage.dart';


class Login extends StatelessWidget {
  @override
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => home()));
  }

  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void login() async {
      Map<dynamic, dynamic> UserData = {};
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final String email = emailController.text;
      final String password = passwordController.text;
      print("email: " + email);
      print("password: " + password);
      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
            if(user!=null)
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => home()));
            }

        final DocumentSnapshot snapshot =
            await db.collection('user').doc(user.user!.uid).get();

        final data = snapshot.data();
        //   setState(() {
        //   UserData = data;
        //   UserData['provider'] = 'Email';
        // });
        Navigator.of(context).pushNamed("/home");

        print(
            '=========================User is Login...=============================');

        
        print("User is Logged");
      } catch (e) {
        print("error");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("$e"),
              );
            });

        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Details'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.black, width: 2),
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightBlue.shade400,
              Colors.pink.shade600,
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80, top: 5),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Enter Email Id",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(00),
                              child: Icon(Icons.email),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(00),
                              child: Icon(Icons.lock),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal[300],
                                onPrimary: Colors.deepOrangeAccent[50],
                                onSurface: Colors.deepPurple,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            child: Text(
                              'Login',
                            ),
                          ),
                        ),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: Text("----------or----------",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Forgot your password?',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = Register() as GestureTapCallback?,
                                ),
                              ],
                            ),
                          ),
                        )),
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'New to RiaChat? ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black)),
                                TextSpan(
                                    text: 'SignUp',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => home(),
                                          ),
                                        );
                                      })
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ), 
          ),
        ),
      ),
    );
  }
}*/