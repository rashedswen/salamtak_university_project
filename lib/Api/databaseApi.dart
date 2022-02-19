import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:salamtak_university_project/model/User.dart';

class DatabaseApi extends ChangeNotifier {
  String? uid;
  DatabaseApi({uid});

  final CollectionReference userInformation =
      FirebaseFirestore.instance.collection('user_data');

  Future<void> addUser(String fullName, String address, String age) async {
    return await userInformation.doc(uid).set({
      'full_name': fullName,
      'address': address,
      'age': age,
    });
  }

  UserDataF _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserDataF(
      uid: uid!,
      fullName: data['fullName'],
      address: data['address'],
      age: data['age'],
      bpm: data['bpm'],
      temperature: data['temperature'],
    );
  }

  Stream<UserDataF> get UserData {
    return userInformation.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
