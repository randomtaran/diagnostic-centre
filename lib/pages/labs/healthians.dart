import 'package:laboratory/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:math';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/src/material/colors.dart';
late List<String> blogs = [' ',''];


//codebase used to List tests available in Healthians Lab
class HealthiansLab extends StatefulWidget {
  const HealthiansLab({Key? key}) : super(key: key);

  @override
  State<HealthiansLab> createState() => _HealthiansLabState();
}

class _HealthiansLabState extends State<HealthiansLab> {

  List<String>? TestName = [];
  List<String>? result1 = [];
  List<String>? result2 = [];
  //String result3 = 'Result 3';
  List<String>? result4 = [];
  List<String>? result5=[];
  bool isLoading = true;
  bool _enabled = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
  Stream<int>.periodic(Duration(seconds: 3), (x) => refreshNum);

  ScrollController? _scrollController;

  Future<List<String>?> extractMaxLabData() async {
    List<String> titles = [];
    final response = await http.Client().get(Uri.parse('https://www.healthians.com/popular-package'));
    if(response.statusCode == 200){
      var document = parser.parse(response.body);
      try {

        for(int j=0;j<10;j++)
        {
          var resp=document.getElementsByClassName('mainpopularpkg')[j]
              .children[0].children[0];
          result4!.add(resp.text.toString());

        }
        //final taran = jsonDecode(response.body);
        //print(taran);

        //result4 = resp.text.toString();
        print(result4);
        //result1=jsonEncode(taran['checkup-box-head']);
        /*var responseString1 = document
            .getElementsByClassName('articles-list')[0]
            .children[0]
            .children[0]
            .children[0];

        print(responseString1.text.trim());

        // Scraping the second article title
        var responseString2 = document
            .getElementsByClassName('articles-list')[0]
            .children[1]
            .children[0]
            .children[0];

        print(responseString2.text.trim());

        // Scraping the third article title
        var responseString3 = document
            .getElementsByClassName('articles-list')[0]
            .children[2]
            .children[0]
            .children[0];

        print(responseString3.text.trim());*/

        return result4!;
      }catch(e){
        return ['error ${e}'];
      }
    } else{
      return ['error'];
    }

  }

  Future<List<String>?> extractMaxLabDataPrice() async {
    List<String> titles = [];
    final response = await http.Client().get(Uri.parse('https://www.maxlab.co.in/lab-tests?page=1'));
    if(response.statusCode == 200){
      var document = parser.parse(response.body);
      try {

        for(int j=0;j<15;j++)
        {
          var resp=document.getElementsByClassName('after')[0];
          result5!.add(resp.text.toString());

        }

        print(result5);

        return result5!;
      }catch(e){
        return ['error ${e}'];
      }
    } else{
      return ['error'];
    }

  }

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }

  static final List<String> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          // Setting isLoading true to show the loader
          setState(() {
            isLoading = true;
          });

          // Awaiting for web scraping function
          // to return list of strings
          final response = await extractMaxLabData();
          final tt= await extractMaxLabDataPrice();
          print(response);
          // Setting the received strings to be
          // displayed and making isLoading false
          // to hide the loader
          setState(() {
            result1 = response;
            result2 = tt;
            //result3 = response![0];
            isLoading = false;
          });
        },
        child: Icon(Icons.refresh),

        backgroundColor: Colors.black,
      ),

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Healthians Lab Tests',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 27.0,
              color: Colors.white,

            )),
        centerTitle: true,
      ),

      body:
      isLoading
          ? Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 69.0,
                          height: 69.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 10.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 10.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Container(
                                width: 50.0,
                                height: 10.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 9,
                ),
              ),
            ),
          ],
        ),
      ): SafeArea(
          child: ListView.builder(
            padding: kMaterialListPadding,
            itemCount: 10,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              final String item = _items[index];
              return Container(
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
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    //borderRadius: BorderRadius.all(Radius.circular(25)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.teal,Colors.tealAccent[700]!]
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(result1![index].trim(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19.0,
                                    letterSpacing: 1.5,
                                    fontFamily: 'Montserrat'
                                ),),
                              SizedBox(height: 15),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(result2![index].trim(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 1.0,
                                        fontFamily: 'Montserrat'
                                    ),),
                                ],
                              ),

                            ],
                          ),
                          //Image(image: AssetImage('assets/time.png'))
                          //Lottie.network('https://assets8.lottiefiles.com/packages/lf20_9zrznuec.json')
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        // scroll view
      ),
    );
  }
}
