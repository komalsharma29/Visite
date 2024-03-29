// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:visite/walkthrough_module/suryamandir.dart';
import '../backoption.dart';
import '../globals.dart' as globals;
import '3dmodel.dart';
import 'suryamandir.dart';
import 'lab.dart';
import 'classroom.dart';

class actualwalkthrough extends StatefulWidget {
  const actualwalkthrough({super.key});

  @override
  State<actualwalkthrough> createState() => _actualwalkthroughState();
}

class _actualwalkthroughState extends State<actualwalkthrough> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: currentIndex == 1
              ? Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : currentIndex == 2
                  ? Container(
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: (Container(
                        width: 360,
                        height: 300,
                        //color: const  Color.fromARGB(207, 43, 48, 83),
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(207, 43, 48, 83),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                                padding: EdgeInsets.all(6),
                                child: Center(
                                  child: Text("Select a Department",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white70,
                                      )),
                                )),

                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Divider(
                                color: Colors.white24,
                                height: 4,
                              ),
                            ),

                            SizedBox(
                              width: 360,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(207, 43, 48, 83),
                                    foregroundColor: Colors.white70),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    globals.page = 0;
                                    return const suryamandir();
                                  }));
                                },
                                child: const Text('Entire Department',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ), //

                            const Padding(padding: EdgeInsets.only(top: 5)),

                            SizedBox(
                              width: 360,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(207, 43, 48, 83),
                                    foregroundColor: Colors.white70),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          classroom()));
                                },
                                child: const Text('Classroom',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ), //
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            SizedBox(
                              width: 360,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(207, 43, 48, 83),
                                    foregroundColor: Colors.white70),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    globals.page = 0;
                                    return const lab();
                                  }));
                                },
                                child: const Text('lab',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ), //

                            const Padding(padding: EdgeInsets.only(top: 5)),

                            SizedBox(
                              width: 360,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(207, 43, 48, 83),
                                    foregroundColor: Colors.white70),
                                onPressed: () {},
                                child: const Text('office',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                          ],
                        ),
                      )))
                  : const choices()),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 10, 12, 20),
        buttonBackgroundColor: const Color.fromARGB(249, 8, 8, 14),
        color: const Color.fromARGB(251, 20, 22, 40),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(
            Icons.navigate_before,
            color: Colors.white60,
            size: 40,
          ),
          Icon(
            Icons.add_home_rounded,
            color: Colors.white60,
            size: 40,
          ),
          Icon(
            Icons.list,
            color: Colors.white60,
            size: 40,
          ),
        ],
        onTap: ((int index) {
          setState(() {
            currentIndex = index;
          });
        }),
      ),
    );
  }
}
