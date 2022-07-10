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

class LalpathLab extends StatefulWidget {
  const LalpathLab({Key? key}) : super(key: key);

  @override
  State<LalpathLab> createState() => _LalpathLabState();
}

class _LalpathLabState extends State<LalpathLab> {

  String TestName = 'Test Name';
  List<String>? result1 = [];
  String result2 = 'Result 2';
  String result3 = 'Result 3';
  List<String>? result4 = [];
  bool isLoading = true;
  bool _enabled = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
  Stream<int>.periodic(Duration(seconds: 3), (x) => refreshNum);

  ScrollController? _scrollController;

  Future<List<String>?> extractLalpathLabData() async {
    List<String> titles = [];
    final response = await http.Client().get(Uri.parse('https://www.lalpathlabs.com/test/list'));
    dom.Document html = dom.Document.html(response.body);

    final prices = html.querySelectorAll('div.col-sm-9.col-9 > h4')
        .map((element) => element.innerHtml.trim()).toList();
    print('Count: ${prices.length}');
    for(final price in prices){
      debugPrint(price);
    }
    if(response.statusCode == 200){
      var document = parser.parse(response.body);
      try {

        for(int j=0;j<15;j++)
        {
          var resp=document.getElementsByClassName('rupee')[j]
              .children[0];
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

        return prices;
      }catch(e){
        return ['error ${e}'];
      }
    } else{
      return ['error'];
    }

  }

  Future<List<String>?> extractLalpathLabDataPrice() async {
    List<String> titles = [];
    final response = await http.Client().get(Uri.parse('https://www.lalpathlabs.com/test/list'));

    dom.Document html = dom.Document.html(response.body);

    final prices = html.querySelectorAll('h4')
        .map((element) => element.innerHtml.trim()).toList();
    print('Count: ${prices.length}');
    for(final price in prices){
      debugPrint(price);
    }

    if(response.statusCode == 200){
      var document = parser.parse(response.body);
      try {

        for(int j=0;j<15;j++)
        {
          var resp=document.getElementsByClassName('checkup-bottom')[j]
              .children[0];
          result4!.add(resp.text.toString());

        }

        print(result4);

        return prices;
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
          final response = await extractLalpathLabData();
          final tt= await extractLalpathLabDataPrice();
          print(response);
          // Setting the received strings to be
          // displayed and making isLoading false
          // to hide the loader
          setState(() {
            result1 = response;
            //result2 = response![0];
            //result3 = response[0];
            isLoading = false;
          });
        },
        child: Icon(Icons.refresh),

        backgroundColor: Colors.black,
      ),

      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: Text('Dr Lalpath Lab',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 27.0,
              color: Colors.white,

            )),
        centerTitle: true,
      ),

      body: /*Padding(
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
                    Text(result1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(result2,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(result3,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                MaterialButton(
                  onPressed: () async {

                    // Setting isLoading true to show the loader
                    setState(() {
                      isLoading = true;
                    });

                    // Awaiting for web scraping function
                    // to return list of strings
                    final response = await extractMaxLabData(2);

                    // Setting the received strings to be
                    // displayed and making isLoading false
                    // to hide the loader
                    setState(() {
                      result1 = response[0];
                      result2 = response[0];
                      result3 = response[0];
                      isLoading = false;
                    });
                  },
                  child: Text(
                    'Scrap Data',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                )
              ],
            )),
      ),*/

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
            itemCount: _items.length,
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
                        colors: [Colors.blueAccent,Colors.blue]
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
                            Text(result1![index],
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
                                Text('yet to be coded',
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
              );
            },
          )
        // scroll view
      ),
    );
  }
}
