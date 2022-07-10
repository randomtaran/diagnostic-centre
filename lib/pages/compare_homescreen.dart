import 'package:flutter/material.dart';
import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';


//Comparison Homescreen
class CompareHomeScreen extends StatefulWidget {
  const CompareHomeScreen({Key? key}) : super(key: key);

  @override
  State<CompareHomeScreen> createState() => _CompareHomeScreenState();
}

class _CompareHomeScreenState extends State<CompareHomeScreen> {

  String searchText = " ";

  Future<List<String>> searchData(String val) async {
    final String searchUrl = 'https://www.maxlab.co.in/searchall';
    Map<String, String> searchBody = {
      "search" : "inter"
    };

    final response = await http.post(Uri.parse(searchUrl), body: searchBody);

    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print(body);
    }
    return [" "," "];

  }

  final _dropdownFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Compare',
        style: TextStyle(
          color: Colors.white,
          fontSize: 42.0,
          letterSpacing: 2.0,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),*/
      body:  Center(
              child: Form(
                key: _dropdownFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    IconButton(
                      iconSize: 36,
                      alignment: Alignment.topLeft,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.blueAccent,
                    ),
                    Row(
                      mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Text(' Hello!\n\n Compare\n Lab\n Test\n Prices.\n',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 34.0,
                                letterSpacing: 1.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                              ),),
                          ),
                        ),
                        Expanded(
                          child: Image(
                            image: AssetImage('assets/nurse.jpg'),

                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Here you can check price of a particular lab test across the Different labs available',style: TextStyle(
                            color: Colors.black54,
                            fontSize: 19.0,
                            letterSpacing: 1.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          image: DecorationImage(
                            opacity: 0.44,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/bg-hosp.png'),
                          ),
                          boxShadow: [
                             //BoxShadow
                          ],
                          //color: Colors.tealAccent.shade100
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedSearchBar(
                        searchStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 21.0,
                          letterSpacing: 1.5,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                        label: "Enter Test Name Here",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 19.0,
                          letterSpacing: 1.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                        onChanged: (val){
                          print("$val on Change");
                          Future<List<String>> d=searchData(val);
                          print(d);
                          setState(() {
                            searchText = val;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      searchData("inter");
                    }, child: Icon(Icons.ac_unit))
                  ],
                )
              )

      ),
      );
  }
}
