import 'package:flutter/material.dart';
import 'package:laboratory/services/auth.dart';
import 'package:laboratory/components/background.dart';

class Login extends StatefulWidget {

  final Function toggleView;
  Login({required this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
        title: Text('SignIn to Laboratory'),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            letterSpacing: 2.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold
        ),
        actions: <Widget>[
          TextButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[900]!),
                splashFactory: InkSplash.splashFactory
            ),
            icon: Icon(Icons.person,
              color: Colors.white,),
            label: Text('Register',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
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
                  "WELCOME\nBACK !",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 32.0,
                      letterSpacing: 1.5,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: size.height * 0.02),

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

              SizedBox(height: 3,),
              Text(error,
                style: TextStyle(color: Colors.red, fontSize:14.0, fontFamily: 'Montserrat'),),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Montserrat',
                      //fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.01),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                      if(result==null) {
                        setState(() => error = '''can't login with provided credentials''');
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
                      "LOGIN",
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
                    "Don't Have an Account? Sign up",
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
      ),/*Column(
        children: [
          SizedBox(height: 38,),
          CustomPaint(
            painter: RPS(),
            child: Container(
                //height: 200,
                child: Center(
                  child: Text('SignIn to Laboratory',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34.0,
                      letterSpacing: 2.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
          ),
          Container(
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
                        'Sign in',
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
          ),
        ],
      ),*/
    );
  }
}


/*class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w=size.width;
    double h=size.height;

    final path=Path();

    path.moveTo(0, 100);
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w*0.5,
      h-100,
      w,
      h
    );
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}*/

class RPS extends CustomPainter{


  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.0008333,size.height*0.1100000);
    path0.quadraticBezierTo(size.width*0.0429167,size.height*0.1328571,size.width*0.0825000,size.height*0.0014286);
    path0.quadraticBezierTo(size.width*0.2289583,size.height*-0.0114286,size.width*0.2708333,0);
    path0.cubicTo(size.width*0.2504167,size.height*0.2410714,size.width*0.1504167,size.height*0.1560714,size.width*0.1450000,size.height*0.3485714);
    path0.quadraticBezierTo(size.width*0.0539583,size.height*0.4064286,size.width*0.0008333,size.height*0.2714286);
    path0.quadraticBezierTo(size.width*0.0006250,size.height*0.0825000,size.width*0.0008333,size.height*0.1100000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}