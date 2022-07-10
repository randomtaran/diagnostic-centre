import 'package:flutter/material.dart';
import 'package:laboratory/pages/intro.dart';
import 'package:provider/provider.dart';
import 'package:laboratory/pages/authenticate/authenticate.dart';
import 'package:laboratory/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);

    //return either Home or Authenticate widget
    if(user == null){
      return Authenticate();
    }
    else{
      return IntroPage();
    }
  }
}
