class MyUser{

  final String? uid;

  MyUser({ this.uid });

}

class UserData {

  final String? uid;
  final String name;
  final String age;
  final double bmi;
  final bool isVaxxed;

  UserData({required this.uid, required this.name, required this.age, required this.bmi, required this.isVaxxed});

}