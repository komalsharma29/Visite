import 'package:flutter/material.dart';

import 'package:visite/welcome.dart';
import 'package:visite/Background.dart';
import 'package:visite/Login_module/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';

class Sign_up extends StatefulWidget {
  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final _auth = FirebaseAuth.instance;
  bool _validate = false;
  final _formKey = new GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailcontroller = TextEditingController();

    final TextEditingController _passcontroller = TextEditingController();

    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String email = _emailcontroller.text;
      final String password = _passcontroller.text;
      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await db.collection('user').doc(user.user!.uid).set({
          "email": email,
        });

        print('User is now registered');
      } catch (e) {
        print('Error');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text("$e"),
              );
            });
      }
    }

    return Stack(
      children: [
        background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Welcome_page()));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                              height: 35,
                              alignment: Alignment.topLeft,
                              child: const Text('Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(225, 255, 255, 255),
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        )), //ink

                    Padding(
                      //
                      padding: const EdgeInsets.symmetric(horizontal: 20),

                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: const TextStyle(
                              color:
                                  Colors.white, // Set the text color to white
                            ),
                            controller: _emailcontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                labelText: 'Email', fillColor: Colors.white),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && !EmailValidator.validate(value)
                                    ? 'Enter valid email'
                                    : null,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: const TextStyle(
                              color:
                                  Colors.white, // Set the text color to white
                            ),
                            controller: _passcontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                fillColor: Color.fromARGB(255, 255, 255, 255)),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? 'Enter valid password'
                                    : null,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: register,
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                backgroundColor:
                                    Color.fromARGB(207, 32, 35, 61),
                                foregroundColor: Colors.white70,
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: const Text(
                              'SignUp',
                            ),
                          ),
                        ],
                      ),
                    ), //

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ?',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const Text('Login',
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
              )),
        ),
      ],
    );
  }
}
