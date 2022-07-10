import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laboratory/models/people.dart';
import 'package:laboratory/models/user.dart';


//code base for integration of cloud firestore with our Flutter app
class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference peopleCollection = FirebaseFirestore.instance.collection('people');

  Future updateUserData(String? name, String? age, double? bmi, bool? isVaxxed) async {
    return await peopleCollection.doc(uid).set({
      'age' : age,
      'bmi' : bmi,
      'isVaxxed' : isVaxxed,
      'name' : name,
    });
  }

  // people list from snapshot
  List<People> _peopleListFromSnapshot(QuerySnapshot snapshot) {
    try{
      return snapshot.docs.map((d) {
        return People(
          name: d['name'],
          age: d['age'],
          bmi: d['bmi'],
          isVaxxed: d['isVaxxed'] ?? false,
        );
      }).toList();
    } catch(e) {
      print(e.toString());
      return [];
    }
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(uid: uid, name: snapshot['name'], age: snapshot['age'], bmi: snapshot['bmi'], isVaxxed: snapshot['isVaxxed']);
  }

  // get brews stream
  Stream<List<People>> get people {
    return peopleCollection.snapshots()
    .map(_peopleListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return peopleCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  /*fetchData(){
    CollectionReference peopleCollection = FirebaseFirestore.instance.collection('people');
  }*/
}