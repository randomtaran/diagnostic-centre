import 'package:flutter/material.dart';

//About Us page

class Bio extends StatefulWidget {
  const Bio({Key? key}) : super(key: key);

  @override
  State<Bio> createState() => _BioState();
}

class _BioState extends State<Bio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title : Text('About Me'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 42.0,
            fontFamily: 'Montserrat'
        ),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/Avatar.jpeg'),
                  radius: 69,

                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.blueAccent,
              ),
              Text(
                  'NAME',
                  style: TextStyle(
                    color: Colors.black45,
                    letterSpacing: 2.0,
                      fontFamily: 'Montserrat'
                  )
              ),
              SizedBox(height: 9.0), //It is used to add space between the column
              Text(
                  'TARANJIT SINGH',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    letterSpacing: 2.0,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'
                  )
              ),
              SizedBox(height: 32.0), //It is used to add space between the column
              Text(
                  'PRESENT COURSE OF STUDY',
                  style: TextStyle(
                    color: Colors.black45,
                    letterSpacing: 2.0,
                      fontFamily: 'Montserrat'
                  )
              ),
              SizedBox(height: 9.0), //It is used to add space between the column
              Text(
                  'B.E Information Technology',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    letterSpacing: 2.0,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'
                  )
              ),
              SizedBox(height: 32.0),
              Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.black45,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                        'ue208111.taranjit.it@gmail.com',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          letterSpacing: 1.0,
                            fontFamily: 'Montserrat'
                        )
                    ),
                  ]
              )
            ],
          )
      ),
    );
  }
}
