import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laboratory/pages/home.dart';
import 'package:lottie/lottie.dart';

//RAdiology test , prices, timings, contact, home picking available or not screen

late List<String> blogs = [];
var cityref;
class WebScrap extends StatefulWidget {

  final List<String> states;
  final List<String> cities;
  var i;
  var test;

  WebScrap({required this.states, required this.cities, required this.i, required this.test});

  @override
  _WebScrapState createState() => _WebScrapState();
}

class _WebScrapState extends State<WebScrap> {

  bool isLoading = false;
  //late List<String> blogs = [];

  Future<List<String>> extractData() async {
    //print(widget.states);
    List<String> titles = [];
    List<String> titles2 = [];
    var state = states[i];
    var city = cities[i];
    final response = await http.Client().get(Uri.parse('https://www.lalpathlabs.com/$state/$city'));
    if(response.statusCode == 200){
      var doc = parser.parse(response.body);
      try {
        for (int i = 1; i < 15; i++) {
          //if (i == 3 || i == 2) continue;

          var resp1 = doc.getElementsByClassName('secBox')[i]
          .children[0];
          titles.add(resp1.text.toString());
          cityref=titles;

          var resp2 = doc.getElementsByClassName('nameBox')[i]
          .children[0];
          titles2.add(resp2.text.toString());

          print(resp2);
        }

        //print(cityref);
        return titles;
      }catch(e){
        return ['error ${e}'];
      }
    } else{
      return ['error'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.blue[500],
        title: Text('Labs',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MaterialButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    blogs = await extractData();
                    setState(() {
                      isLoading = false;
                    });
                  },
                minWidth: 20,
                color: Colors.blueGrey[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                padding: const EdgeInsets.all(8.0),
                  child: Text('Refresh',
                  style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Montserrat'
                  ),),
                ),
              SizedBox(height: 16),

              isLoading
                  ? CircularProgressIndicator()
                  : Expanded(
                child: ListView.builder(
                    itemCount: blogs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                              primary: Colors.blueAccent,
                              elevation: 6,
                              onPrimary: Colors.white,
                              shadowColor: Colors.blue
                              ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                              child: Text(blogs[index].toString(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 19,
                              ),),
                            ),
                              onPressed: (){
                              var hi;
                              hi=index;
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoScrap(states: states,cities: cities,blogs:blogs,hi:hi)));
                              }
                          ),
                          SizedBox(height: 12)
                        ],
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoScrap extends StatefulWidget {

  InfoScrap({required this.states, required this.cities, required this.blogs, required this.hi});
  var states;
  var cities;
  var blogs;
  var hi;

  @override
  _InfoScrapState createState() => _InfoScrapState();
}
class _InfoScrapState extends State<InfoScrap> {
  List<String>? _user;
  // Strings to store the extracted Article titles
  //var test=blogs[t];


  //var _states = widget.states;
  //var _city = "chandigarh";
  List<String> _area = ["41-b-chandigarh",
                          'chandigarh7',
                            'sector-38c',
                            'khudda-lahora-chandigarh',
                            'manimajra',
                            'sector-11-a',
                            'sector-16-chandigarh',
                            'sector-19d'];
  // boolean to show CircularProgressIndication
  // while Web Scraping awaits
  bool isLoading = false;

  //static var t;



  Future<List<String>> extractLabData() async {

    final String apiUrl = 'https://www.lalpathlabs.com/centerdataservice.asmx/GetCenterDataRevamp';
    //print(widget.states);
    Map<String, String> body1 = {
      "state": "${widget.states[0]}",
      "city": "${widget.cities[0]}",
      "area": "${_area[widget.hi]}"
    };
    print('${widget.states[widget.hi]} ${widget.cities[widget.hi]} ${_area[widget.hi]}');
    // Posting request to get the response from the targeted url
    final response =
    await http.post(Uri.parse(apiUrl), body: body1);


    // Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {

      String result1 = 'Timings';
      String result2 = 'Price';
      String result3 = 'Contact No.';
      String result4 = 'Home Collection Facility';
      final body = jsonDecode(response.body);
      //print(body['LabTiming']);
      //print(body['HomecollectionCharge']);
      final String responseString=response.body;
      int n1=result1.length;
      //print(n1);
      int n2=result2.length;
      //print(n2);
      result1 =jsonEncode(body['LabTiming'][0]['opentime']);
      result2=jsonEncode(body['HomecollectionCharge']);
      result3=jsonEncode(body['centercontact']).substring(14,25);
      result4=jsonEncode(body['HomecollectionFacility']);
      print(widget.hi);
      print(result3);
      print(result4);
      //print(blogs);
      //print(states);
      //print(hi);
      //print("Lab Timings are "+responseString.substring(59, 70)+'\n'+ "Price is "+responseString.substring(1244,1250));
      return [result1, result2, result3, result4];
      // Getting the html document from the response
      /*var document = parser.parse(response.body);
      try {

        // Scraping the first article title
        var responseString1 = document
              .getElementsByClassName('HomecollectionCharge')[0].text.toString();
            /*.getElementsByClassName('orange-Lab')[0]
            .children[1].text
            .toString();*/

        print(responseString1);

        // Scraping the second article title
        var responseString2 = document
            .getElementById('labDetail');

        //print(responseString2!);


        // Converting the extracted titles into
        // string and returning a list of Strings

      } catch (e) {
        //return ['', '', 'ERROR!'];
      }*/
    } else {
      //return ['', '', 'ERROR: ${response.statusCode}.'];
      return null!;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lab Info',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              color: Colors.white,

            )),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // if isLoading is true show loader
                // else show Column of Texts
                isLoading
                    ? CircularProgressIndicator()
                    : Column(
                  children: [
                    Container(
                      child: Container(
                        width: 350,
                        height: 125,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 09,
                              blurRadius: 09,
                              offset: Offset(0, 0),
                            )
                          ],
                          color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.lightGreen,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.green[500]!,Colors.green[500]!]
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Timings',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32.0,
                                        letterSpacing: 1.5,
                                        fontFamily: 'Montserrat'
                                    ),),
                                  SizedBox(height: 15),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${_user?[0].substring(1,12)}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.0,
                                            letterSpacing: 1.0,
                                            fontFamily: 'Montserrat'
                                        ),),
                                    ],
                                  ),

                                ],
                              ),
                              //Image(image: AssetImage('assets/time.png'))
                              Lottie.network('https://assets8.lottiefiles.com/packages/lf20_9zrznuec.json')
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      width: 350,
                      height: 125,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 07,
                            blurRadius: 07,
                            offset: Offset(0, 0),
                          )
                        ],
                        color: Colors.greenAccent,
                        border: Border.all(
                          color: Colors.lightGreen,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.green[500]!,Colors.green[500]!]
                        ),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Price',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32.0,
                                      letterSpacing: 1.5,
                                      fontFamily: 'Montserrat'
                                  ),),
                                SizedBox(height: 15),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('₹ ${_user?[1].substring(1,7)}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21.0,
                                          letterSpacing: 1.0,
                                          fontFamily: 'Montserrat'
                                      ),),
                                  ],
                                ),

                              ],
                            ),
                            Lottie.network('https://assets5.lottiefiles.com/packages/lf20_WKOIej.json')
                            //Image(image: AssetImage('assets/rupee.png'))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      child: Container(
                        width: 350,
                        height: 125,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 07,
                              blurRadius: 07,
                              offset: Offset(0, 0),
                            )
                          ],
                          color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.lightGreen,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.green[500]!,Colors.green[500]!]
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Contact No.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32.0,
                                        letterSpacing: 1.5,
                                        fontFamily: 'Montserrat'
                                    ),),
                                  SizedBox(height: 15),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${_user?[2]}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21.0,
                                            letterSpacing: 1.0,
                                            fontFamily: 'Montserrat'
                                        ),),
                                    ],
                                  ),

                                ],
                              ),
                              Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_psxn1zju.json')
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Container(
                      child: Container(
                        width: 350,
                        height: 125,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 07,
                              blurRadius: 07,
                              offset: Offset(0, 0),
                            )
                          ],
                          color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.lightGreen,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.green[500]!,Colors.green[500]!]
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Home Collection',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.0,
                                    letterSpacing: 1.5,
                                    fontFamily: 'Montserrat'
                                ),),
                              SizedBox(height: 15),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${_user?[3]}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21.0,
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
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                MaterialButton(
                  onPressed: () async {

                    // Setting isLoading true to show the loader
                    setState(() {
                      isLoading = true;
                    });

                    final List<String> user = await extractLabData();
                    // Awaiting for web scraping function
                    // to return list of strings
                    final response = await extractLabData();

                    // Setting the received strings to be
                    // displayed and making isLoading false
                    // to hide the loader
                    setState(() {
                      //result1 = response[0];
                      //result2 = response[1];
                      _user=user;
                      isLoading = false;
                    });
                  },
                  child: Text(
                    'Refresh Data',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,

                    ),
                  ),
                  color: Colors.green,
                )
              ],
            )),
      ),
    );
  }
}
