import 'package:flutter/material.dart';
import 'package:laboratory/main.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';


//Unused code
class SortedPage extends StatefulWidget {

  SortedPage({required this.selected_city});
  String selected_city;

  @override
  State<SortedPage> createState() => _SortedPageState();
}

class _SortedPageState extends State<SortedPage> {

  TextStyle used = TextStyle(
      color: Colors.black,
      fontSize: 10,
      letterSpacing: 1.0,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold
  );
  List<dynamic> _data=["                                                                                                                   "];
  bool isLoading = false;
  String? stateName;
  List<dynamic>? areaName;
  var k;
  Future<List<String>> sortedLabData() async {
    final String DataUrl = 'https://www.lalpathlabs.com/centerdataservice.asmx/GetCenterDataRevamp';
    if(widget.selected_city == 'chandigarh') {
      stateName = "chandigarh";
      areaName = ["41-b-chandigarh",
        "naya-gaon",
        "chandigarh7",
        "sector-38c",
        "khudda-lahora-chandigarh",
        "manimajra",
        "sector-11-a",
        "sector-16-chandigarh",
        "sector-19d",
        "sector-24d"];
    }
    else if(widget.selected_city == 'ambala'){
      stateName= "haryana";
      areaName= ["ambala-city",
      "near-mullana-university",
      "baldev-nagar",
      "naringarh-road",
      "near-fountain-chowk-naraingarh",
      "nicholson-road",
      "opp-easy-day",
      "polytechnic-chowk",
      "police-line"];
    }
    else if(widget.selected_city == 'amritsar'){
      stateName="punjab";
      areaName=["batala-road",
      "chheharta-chowk",
      "guru-ram-dass-avenue--",
      "gurudwara-sarai-road",
      "hathi-gate",
      "hathi-gate-amritsar",
      "lawerence-road-khorana-center",
      "majitha-road-jagdambay-colony",
      "majitha-road",
      "tung-wala-pull"];
    }
    else{
      stateName="delhi-ncr";
      areaName=["40ft-road-badarpur",
      "adarsh-nagar",
      "adchini",
      "alipur",
      "moti-lal-nehru-college",
      "anand-vihar-opposite-gurudwara",
      "anand-vihar-c-block",
      "ashok-vihar",
      "ashok-vihar-phase-2"];
    }


   /* Map<String, dynamic> body2 = {
      "state":stateName,
      "city":widget.selected_city,
      "area":areaName
    };*/

    print(stateName);
    print(widget.selected_city);

    List DataList=[];

    for(int k=0 ; k<9 ; k++){
      Map<String, String> body3 = {
        "state":"${stateName}",
        "city":"${widget.selected_city}",
        "area":"${areaName?[k]}"
      };
      final response1 =
      await http.post(Uri.parse(DataUrl), body: body3);
      if(response1.statusCode == 200){


          //String result1 = 'Timings';
          String result2 = 'Price';
          final body = jsonDecode(response1.body);
          //print(body['LabTiming']);
          //print(body['HomecollectionCharge']);
          final String responseString=response1.body;
          //int n1=result1.length;
          //print(n1);
          int n2=result2.length;
          //print(n2);
          //result1 =jsonEncode(body['LabTiming'][0]['opentime']);
          print("Taran /compare");
          DataList.insert(k, jsonEncode(body['HomecollectionCharge']));
          print(DataList);
          //print(result1);
          //print(blogs);
          //print(states);
          //print(hi);
          //print("Lab Timings are "+responseString.substring(59, 70)+'\n'+ "Price is "+responseString.substring(1244,1250));
          //return ["DataList","DataList","DataList""DataList","DataList","DataList","DataList","DataList"];
          //return ["${DataList}"];

      }
      else{
        return ['error'];
      }
    }
    return ['${DataList}'];

  }

  int _currentSortColumn=0;
  bool _isSortAsc = true;
  //var _selected_city=widget.selected_city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Diagnostic Centres',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          letterSpacing: 1.5,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        )),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.lightGreenAccent.shade100),
                  dividerThickness: 3.0,
                  headingTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13.8,
                      letterSpacing: 1.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),
                  horizontalMargin: 0.5,
                  showBottomBorder: true,
                  columns: [
                    DataColumn(
                      label: Text('Sno.'),
                    ),
                    DataColumn(
                      label: Text('Diagnostic Centre'),
                    ),
                    DataColumn(
                      label: Text('Price'),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('${areaName?[0]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(1,9)}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('${areaName?[1]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(10,18)}'))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3')),
                      DataCell(Text('${areaName?[2]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(19,27)}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('4')),
                      DataCell(Text('${areaName?[3]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(28,36)}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('5')),
                      DataCell(Text('${areaName?[4]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(37,45)}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('6')),
                      DataCell(Text('${areaName?[5]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(46,54)}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('7')),
                      DataCell(Text('${areaName?[6]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(55,63)}')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('8')),
                      DataCell(Text('${areaName?[7]}',style: used,)),
                      DataCell(Text('₹${_data[0].toString().substring(64,72)}')),
                    ]),
                  ]),
            ),
          ),
          SizedBox(height:12),
          MaterialButton(
            onPressed: () async {

              // Setting isLoading true to show the loader
              setState(() {
                isLoading = true;
              });

              final List<String> data = await sortedLabData();
              // Awaiting for web scraping function
              // to return list of strings

              // Setting the received strings to be
              // displayed and making isLoading false
              // to hide the loader
              setState(() {
                _data=data;
                isLoading = false;
              });
            },
            child: Text(
              'Fetch Data',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,

              ),
            ),
            color: Colors.green,
          ),
        ],
      )
    );
  }
}
