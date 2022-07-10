import 'package:flutter/material.dart';
import 'package:laboratory/pages/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:laboratory/models/user.dart';
import 'package:laboratory/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
/*void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/' : (context) => IntroPage(),
    //'/home' : (context) => HomePage(),
}
));*/


//main.dart where our app starts executing

void main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
       // options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return StreamProvider<MyUser?>.value(
            catchError: (_,__) => null,
            initialData: null,
            value: AuthService().user,
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Wrapper(),
            ),
        );
    }
}