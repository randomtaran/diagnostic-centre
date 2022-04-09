import 'package:flutter/material.dart';
import 'package:laboratory/main.dart';
import 'package:lottie/lottie.dart';
import 'package:laboratory/pages/home.dart';
import 'package:laboratory/pages/info.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        leading: Expanded(
          child: Lottie.asset('assets/laboratory_icon.json'),
        ),
        backgroundColor: Colors.green,
        title: Text('Laboratory'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 42.0,
          letterSpacing: 2.0,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Bio()));
              },
              icon: Icon(Icons.info_outline))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Lottie.asset('assets/greetings.json'),
          ),
          Center(
            child: Container(
              width: 350,
              height: 325,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    spreadRadius: 7,
                    blurRadius: 5,
                    offset: Offset(0, 7),
                  )
                ],
                color: Colors.greenAccent,
                border: Border.all(
                  color: Colors.lightGreen,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.green[500]!,Colors.green[500]!]
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(' Diagnostic Centre \n Finding App',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        letterSpacing: 1.5,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10),
                    Divider(height:2, thickness: 2,color: Colors.lightGreenAccent[100],),
                    SizedBox(height: 10),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' This app will help you to \n find \n Different labs present in \n different states of India'
                            '\n and you can also compare the\n prices of Different Diagnostic \n Centres',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              letterSpacing: 1.0,
                              fontFamily: 'Montserrat'
                          ),),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height:20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.black,
              shadowColor: Colors.black,
              elevation: 5,
            ),
            child: Text('Search Labs',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Montserrat',
                color: Colors.white
              ),
                ),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
          ),
          SizedBox(height: 15)
        ],
      )
    );
  }
}
