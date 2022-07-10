import 'package:laboratory/main.dart';
import 'package:laboratory/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:laboratory/pages/labs/maxlab.dart';
import 'package:laboratory/pages/labs/lalpath.dart';
import 'package:laboratory/pages/labs/healthians.dart';
import 'package:laboratory/pages/labs/thyrocare.dart';
import 'package:lottie/lottie.dart';

class SelectLab extends StatefulWidget {
  const SelectLab({Key? key}) : super(key: key);

  @override
  State<SelectLab> createState() => _SelectLabState();
}

class _SelectLabState extends State<SelectLab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies',
          style: TextStyle(
            color: Colors.white,
            fontSize: 39.0,
            letterSpacing: 2.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,

      ),
      body: ListView(
        children: <Widget>[
          SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                    child: Lottie.asset('assets/companies.json',
                    )),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MaxLab()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.15),
                          spreadRadius: 07,
                          blurRadius: 07,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Max Lab',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.0,
                              letterSpacing: 1.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                          ),),
                          Image(
                            image: AssetImage('assets/max.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 35),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 15.0,
                  color: Colors.black,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LalpathLab()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.15),
                          spreadRadius: 07,
                          blurRadius: 07,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Dr Lal PathLabs',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21.0,
                                letterSpacing: 1.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                            ),),
                          Image(
                            image: AssetImage('assets/drlal.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 35),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 15.0,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HealthiansLab()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.tealAccent.withOpacity(0.15),
                          spreadRadius: 07,
                          blurRadius: 07,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Healthians Lab',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21.0,
                                letterSpacing: 1.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                            ),),
                          Image(
                            image: AssetImage('assets/healthians.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 35),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 15.0,
                  color: Colors.black,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ThyrocareLab()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.15),
                          spreadRadius: 07,
                          blurRadius: 07,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Text('Thyrocare Lab',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.0,
                              letterSpacing: 1.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                          ),),
                        Image(
                          image: AssetImage('assets/trans-logo.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                //SizedBox(height: 35),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  height: 15.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}

