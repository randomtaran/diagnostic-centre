import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratory/pages/compare_homescreen.dart';
import 'package:laboratory/pages/tests_list.dart';
import 'package:lottie/lottie.dart';
import 'package:laboratory/pages/home.dart';
import 'package:laboratory/pages/info.dart';
import 'package:laboratory/services/auth.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
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
      ),*/
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            //pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                    image: AssetImage('assets/hospital.jpg',
                ),
                ),
              title: Text('Laboratory',
              style: TextStyle(
                shadows: [
                  Shadow( // bottomLeft
                      offset: Offset(-1.5, -1.5),
                      color: Colors.white
                  ),
                  Shadow( // bottomRight
                      offset: Offset(1.5, -1.5),
                      color: Colors.white
                  ),
                  Shadow( // topRight
                      offset: Offset(1.5, 1.5),
                      color: Colors.white
                  ),
                  Shadow( // topLeft
                      offset: Offset(-1.5, 1.5),
                      color: Colors.white
                  ),
                ],
                  color: Colors.black,
                  fontSize: 34.0,
                  letterSpacing: 2.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
              ),),
            ),
          ),

          SliverList(delegate: SliverChildListDelegate(
            [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Container(
                    width: 350,
                    height: 125,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 07,
                          blurRadius: 07,
                          offset: Offset(0, 0),
                        )
                      ],
                      color: Colors.greenAccent,
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.blueAccent,Colors.blueAccent]
                      ),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Lottie.asset('assets/namaste.json'),
                          ),
                          //SizedBox(width: 6),

                          Expanded(
                            flex:4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Namaste, Taranjit Singh',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21.0,
                                      letterSpacing: 1.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold
                                  ),),
                                SizedBox(height: 12),
                                Text('Great to have you back.',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Montserrat'
                                ),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 350,
                  height: 125,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 07,
                        blurRadius: 07,
                        offset: Offset(0, 0),
                      )
                    ],
                    color: Colors.greenAccent,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.blueAccent,Colors.blueAccent]
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Lottie.asset('assets/bmi.json'),
                        ),
                        //SizedBox(width: 6),
                        Expanded(
                          flex:4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Body Mass Index',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21.0,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(height: 12),
                              Text('23.1',
                                style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 19.0,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Montserrat'
                                ),)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 350,
                  height: 125,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 07,
                        blurRadius: 07,
                        offset: Offset(0, 0),
                      )
                    ],
                    color: Colors.greenAccent,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.blueAccent,Colors.blueAccent]
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Lottie.asset('assets/vaccine.json'),
                        ),
                        //SizedBox(width: 6),
                        Expanded(
                          flex:4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Vaccination Status',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21.0,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold
                                ),),
                              SizedBox(height: 12),
                              Text('Fully Vaccinated',
                                style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 19.0,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Montserrat'
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,)
            ]
          )),

          SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.75,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 07,
                            blurRadius: 07,
                            offset: Offset(0, 0),
                          )
                        ],
                        color: Colors.greenAccent,
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.blueAccent,Colors.blueAccent]
                        ),

                      ),
                      //color: Colors.teal
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Lottie.asset('assets/radiology.json'),
                        ),
                        //SizedBox(height: 6,),
                        Text('Radiology Test',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectLab()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 07,
                            blurRadius: 07,
                            offset: Offset(0, 0),
                          )
                        ],
                        color: Colors.greenAccent,
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.blueAccent,Colors.blueAccent]
                        ),

                      ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Lottie.asset('assets/labs.json'),
                        ),
                        //SizedBox(height: 6,),
                        Text('Available Labs',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CompareHomeScreen()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 07,
                            blurRadius: 07,
                            offset: Offset(0, 0),
                          )
                        ],
                        color: Colors.greenAccent,
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.blueAccent,Colors.blueAccent]
                        ),

                      ),//color: Colors.teal
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Lottie.asset('assets/comparison.json'),
                        ),
                        //SizedBox(height: 6,),
                        Text('Compare Prices',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Bio()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 07,
                            blurRadius: 07,
                            offset: Offset(0, 0),
                          )
                        ],
                        color: Colors.greenAccent,
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.blueAccent,Colors.blueAccent]
                        ),

                      ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Lottie.asset('assets/about.json'),
                        ),
                        //SizedBox(height: 6,),
                        Text('About Us',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text('Laboratory',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    letterSpacing: 1.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold
                ),),
            ),
            ListTile(
              title: const Text('Username',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold
                ),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign Out',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold
                ),),
              onTap: () async {
                // Update the state of the app
                // ...
                // Then close the drawer
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
