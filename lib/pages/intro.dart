import 'package:flutter/material.dart';
import 'package:laboratory/models/people.dart';
import 'package:laboratory/pages/compare_homescreen.dart';
import 'package:laboratory/pages/home.dart';
import 'package:laboratory/pages/info.dart';
import 'package:laboratory/pages/settings_form.dart';
import 'package:laboratory/pages/tests_list.dart';
import 'package:laboratory/services/auth.dart';
import 'package:laboratory/services/database.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  final AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.height * 0.1),
          child: SettingsForm(),
        );
      });
    }

    final people = Provider.of<List<People>?>(context) ?? [];
    print(people);
    people.forEach((people) {
      print(people.name);
      print(people.age);
      print(people.bmi);
      print(people.isVaxxed);
    });
    return StreamProvider<List<People>?>.value(
      initialData: [],
      value: DatabaseService().people,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
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
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
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
                                  Text('Namaste, ${currentName}',
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
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
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
                                Text('$currentBMI',
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
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
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
                                (currentIsVaxxed ?? false) ? Text('Fully Vaccinated',
                                  style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 19.0,
                                      letterSpacing: 1.0,
                                      fontFamily: 'Montserrat'
                                  ),):Text('Not Vaccinated',
                                  style: TextStyle(
                                      color: Colors.redAccent,
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
                  padding: const EdgeInsets.fromLTRB(15, 15, 10, 10),
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
                            child: Image.asset('assets/Radiography-bro.png'),
                          ),
                          //SizedBox(height: 6,),
                          Text('Radiology Test',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
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
                  padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
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
                            child: Image.asset('assets/3519.png'),
                          ),
                          //SizedBox(height: 6,),
                          Text('Available Labs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
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
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
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
                            child: Image.asset('assets/3520.png'),
                          ),
                          //SizedBox(height: 6,),
                          Text('Compare Prices',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
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
                  padding: const EdgeInsets.fromLTRB(10, 10, 15, 15),
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
                            child: Image.asset('assets/3565.png'),
                          ),
                          //SizedBox(height: 6,),
                          Text('About Us',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
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
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                accountName: Text('Taranjit Singh',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),),
                accountEmail: Text('taranjeetsingh033@gmail.com',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/Avatar.jpeg'),
                  radius: 69,

                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle_rounded
                ),
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
              ListTile(
                leading: Icon(
                  Icons.settings
                ),
                title : const Text('Settings',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),),
                onTap: () => _showSettingsPanel(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
