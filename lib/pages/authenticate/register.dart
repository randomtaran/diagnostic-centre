import 'package:flutter/material.dart';
import 'package:laboratory/services/auth.dart';
import 'package:laboratory/components/background.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email=' ';
  String password = ' ';
  String error = ' ';

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.tealAccent[100],
      /*appBar: AppBar(
        backgroundColor: Colors.teal[900],
        elevation: 0.0,
        title: Text('SignUp to radchads'),
        actions: <Widget>[
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[900]!),
            ),
            icon: Icon(Icons.person,
              color: Colors.white,),
            label: Text('Sign-In',
              style: TextStyle(
                color: Colors.white,
              ),),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),*/
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
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 21.0,
                        letterSpacing: 1.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
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
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 21.0,
                        letterSpacing: 1.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  obscureText: true,
                ),
              ),

              /*Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 15.0,
                    letterSpacing: 1.0,
                    fontFamily: 'Montserrat',
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),*/

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
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if(result==null) {
                        setState(() => error = 'please enter a valid email');
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
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(
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
      /*Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (val) {
                    setState(()=>email=val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(()=>password=val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.teal,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: () async{
                    print(email);
                    print(password);
                  },
                ),
              ],
            )
        ),
      ),*/
    );
  }
}
