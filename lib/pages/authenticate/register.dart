import 'package:flutter/material.dart';
import 'package:laboratory/services/auth.dart';
import 'package:laboratory/components/background.dart';
import 'package:laboratory/shared/constants.dart';
import 'package:laboratory/shared/loading.dart';

//REgister PAge
class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //Testing
  /*Map? data;
  String name='';
  List? documents;
  fetchData(){
    CollectionReference peopleCollection = FirebaseFirestore.instance.collection('people');
    peopleCollection.snapshots().listen((snapshot) {


      setState(() {
        documents = snapshot.docs;
      });
      print(documents);
    });
  }*/

  //text field state
  String email=' ';
  String password = ' ';
  String error = ' ';

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return loading ? Loading() : Scaffold(
      body: Form(
        key: _formKey,
        child: Background(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "WELCOME TO \nLABORATORY",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 28.0,
                      letterSpacing: 1.5,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(()=>email=val);
                  },
                  decoration: textInputDecoration.copyWith(labelText: "Username"),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  validator: (val) => val!.length < 6 ? 'Password should 6+ chars long' : null,
                  onChanged: (val) {
                    setState(()=>password=val);
                  },
                  decoration: textInputDecoration.copyWith(labelText: "Password"),
                  obscureText: true,
                ),
              ),


              SizedBox(height: 3.0,),

              Text(error,
              style: TextStyle(color: Colors.red, fontSize:14.0),),

              SizedBox(height: size.height * 0.02),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result==null) {
                        setState(() {
                          error = 'please enter a valid email';
                          loading = false;
                        });
                      }
                    }
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent,
                              Colors.blueAccent
                            ]
                        )
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "SIGNUP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                          letterSpacing: 1.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ()))
                    widget.toggleView()
                  },
                  child: Text(
                    "Already have an Account? Login",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 11.0,
                        letterSpacing: 1.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
