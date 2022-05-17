import 'package:laboratory/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:laboratory/pages/sorted_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:laboratory/services/scraping.dart';

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Chandigarh"),value: "chandigarh"),
    DropdownMenuItem(child: Text("Ambala"),value: "ambala"),
    DropdownMenuItem(child: Text("Amritsar"),value: "amritsar"),
    DropdownMenuItem(child: Text("Delhi"),value: "delhi"),
  ];
  return menuItems;
}
class CompareHomeScreen extends StatefulWidget {
  const CompareHomeScreen({Key? key}) : super(key: key);

  @override
  State<CompareHomeScreen> createState() => _CompareHomeScreenState();
}

class _CompareHomeScreenState extends State<CompareHomeScreen> {

  String selectedValue = "chandigarh";
  final _dropdownFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      ),
      body:  Center(
              child: Form(
                key: _dropdownFormKey,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Lottie.asset('assets/compare.json'),
                    ),
                    SizedBox(height:16),
                    DropdownButtonFormField(

                        isDense: true,
                        elevation: 10,
                        style: TextStyle(
                fontSize: 21,
                    fontFamily: 'Montserrat',
                    color: Colors.black
                ),
                        items: dropdownItems,
                        onChanged: (String? newValue){
                          setState(() {
                            selectedValue=newValue!;
                          });
                    },
                      decoration: InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blueAccent, width: 0.1),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent, width: 0.1),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        filled: true,
                        fillColor: Colors.lightBlueAccent[100],
                      ),
                      validator: (value) => value == null ? "Select a country" : null,
                      dropdownColor: Colors.lightBlueAccent[100],
                      value: selectedValue,
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () async{
                          var selected_city=selectedValue;
                          await Navigator.push(context, MaterialPageRoute(builder: (context)=> SortedPage(selected_city:selected_city)));

                      },
                      child: Text("Submit",
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          color: Colors.white
                      ),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        onPrimary: Colors.black,
                        shadowColor: Colors.black,
                        elevation: 5,
                      ),
                    )
                  ],
                )
              )


              /*DropdownButton(
                items: dropdownItems,
                value: selectedValue,
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    color: Colors.black
                ),
                dropdownColor: Colors.green,
                onChanged: (String? newValue){
                  setState(() {
                    selectedValue=newValue!;
                  });
                },
              )*/

      ),
      );
  }
}
