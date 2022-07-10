import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


//loading screen used in different situations
class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitWanderingCubes(
          color: Colors.blueAccent,
          size: 54.0
        )
      ),
    );
  }
}