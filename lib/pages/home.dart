import 'package:flutter/material.dart';
import 'package:laboratory/main.dart';
import 'package:laboratory/pages/intro.dart';
import 'package:laboratory/services/scraping.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:laboratory/pages/compare_homescreen.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:laboratory/pages/tests_list.dart';


//RAdiology TEst page


var test=['Chandigarh', 'Delhi', 'Haryana', 'Punjab'];

/*final Map<String, String> states = {
  'Chandigarh': 'chandigarh',
  'Delhi': 'delhi-ncr',
  'Haryana': 'haryana',
  'Punjab': 'punjab'
};
 */
final List<String> states = [
  'chandigarh',
  'delhi-ncr',
  'haryana',
  'punjab'
];

final List<String> cities = [
  'chandigarh',
  'delhi',
  'ambala',
  'amritsar',

];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
var i;
class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const IconData filter_list = IconData(0xe280, fontFamily: 'MaterialIcons');

  List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
        itemCount: states.length,
        itemBuilder: (context, index) =>
            ExpansionTile(
                leading: Icon(filter_list),
                title: Text(test[index],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 21,
                  ),),
                children:[
                  TextButton(
                    child: Text('${cities[index].toUpperCase()}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                        )),
                    onPressed: () async{
                      /*final response = await extractData();

                        result1 = response[0];
                        result2 = response[1];
                        result3 = response[2];*/
                        i=index;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> WebScrap(states: cities, cities: cities, i: i, test: test)));
                    },
                  )
                ]
            ),),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        child: Icon(Icons.article_sharp),
        labelsStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 21,
        ),
        closedForegroundColor: Colors.black,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.black,
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: Icon(Icons.article_outlined),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Lab Tests Available',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectLab()));
            },
            closeSpeedDialOnPressed: false,
          ),
          SpeedDialChild(
            child: Icon(Icons.compare),
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            label: 'Compare Prices',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CompareHomeScreen()));
            },
          ),
          //  Your other SpeedDialChildren go here.
        ],
      ),/*FloatingActionButton(
       onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=> CompareHomeScreen()));
       },
        backgroundColor: Colors.green,
        child: Icon(Icons.compare),
        splashColor: Colors.blueAccent,
        elevation: 12,
        tooltip: 'Comparison',
        heroTag: 'taran',
      )*/
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Laboratory'),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 42.0,
            letterSpacing: 2.0,
            fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: DataSearch());

          },)
        ],
      ),
      body: ListView.builder(
        itemCount: states.length,
        itemBuilder: (context, index) =>
            ExpansionTile(
                leading: Icon(filter_list),
                title: Text(test[index],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 21,
                  ),),
                children:[
                  TextButton(
                    child: Text('${cities[index]}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                        )),
                    onPressed: () async{
                      /*final response = await extractData();

                        result1 = response[0];
                        result2 = response[1];
                        result3 = response[2];*/
                      i=index;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> WebScrap(states: [], cities: [], i: [], test: [])));
                    },
                  )
                ]
            ),)
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final recentCities=[
    'Delhi',
    'Ambala',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, " ");
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result on based on selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // when someones searches for seomthing
    final suggestionList = query.isEmpty ? recentCities : cities.where((p)=>p.startsWith(query)).toList();
    
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: () async{
        var i=index;
        Navigator.push(context, MaterialPageRoute(builder: (context)=> WebScrap(states: [], cities: [], i: [], test: [],)));
      },
      leading: Icon(Icons.location_city),
      title: RichText(text: TextSpan(
        text: suggestionList[index].substring(0,query.length),
        style:
            TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 18
            ),
        children: [
          TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Montserrat',
                fontSize: 18
            )
          )
        ]
        ),
      ),
    ),
      itemCount: suggestionList.length,
    );

  }

}
