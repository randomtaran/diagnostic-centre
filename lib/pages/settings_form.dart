import 'package:flutter/material.dart';
import 'package:laboratory/models/user.dart';
import 'package:laboratory/services/database.dart';
import 'package:laboratory/shared/constants.dart';
import 'package:laboratory/shared/loading.dart';
import 'package:provider/provider.dart';


//BottomSheet used to Update User data

List<String> calc(){
  List<String> ageNo = [];
  int numi=0;
  for (numi=0 ;numi<100;numi++) {
    ageNo.add('$numi');
  }

  return ageNo;
}

String? currentName ;
String? currentAge;
double? currentBMI ;
bool? currentIsVaxxed ;

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();

  List<dynamic> ageNum = calc();





  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {

          UserData? userData=snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                      'Update your Profile',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                TextFormField(
                  initialValue: userData?.name,
                  decoration: textInputDecoration.copyWith(labelText: "Name"),
                  validator: (val) => (val?.isEmpty ?? false) ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => currentName = val),
                ),
                SizedBox(height: size.height * 0.01),
                //dropdown for age selection
                DropdownButtonFormField(
                  decoration: textInputDecoration.copyWith(labelText: "Age"),
                  value: currentAge ?? userData?.age,
                  items: ageNum.map((ageNum) {
                    return DropdownMenuItem(
                      value: ageNum,
                      child: Text('$ageNum'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => currentAge=val.toString()),
                ),
                SizedBox(height: size.height*0.03,),
                //slider
                Row(
                  children: [
                    Text("BMI ",
                      style: TextStyle(
                          fontSize: 12.5,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      ),),
                    Slider(
                      value: currentBMI ?? (userData?.bmi ?? 10.0),
                      activeColor: ((currentBMI ?? 10 ) < 18.5 || (currentBMI ?? 10 ) > 25) ? Colors.red: const Color.fromARGB(255, 69, 173, 168),
                      inactiveColor: ((currentBMI ?? 10 ) < 18.5 || (currentBMI ?? 10 ) > 25) ? Colors.redAccent[100] :Colors.greenAccent,
                      min: 10.0,
                      max: 40.0,
                      divisions: 60,
                      onChanged: (val) => setState(() => currentBMI = val),
                      label: currentBMI.toString(),
                    ),
                  ],
                ),
                // SizedBox(height: size.height*0.03,),
                //toggle for vaxxed status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                        'Vaccination Status',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Switch(
                      value: currentIsVaxxed ?? (userData?.isVaxxed ?? false),
                      onChanged: (value) {
                        setState(() {
                          currentIsVaxxed = value;
                          print(currentIsVaxxed);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                  ],
                ),

                SizedBox(height: size.height*0.01,),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    'Update',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () async {

                      await DatabaseService(uid: user?.uid).updateUserData(
                        currentName ?? userData?.name,
                        currentAge ?? userData?.age,
                        currentBMI ?? userData?.bmi,
                        currentIsVaxxed ?? userData?.isVaxxed
                      );
                      Navigator.pop(context);

                  },
                )

              ],
            ),
          );
      }
    );
  }
}
