import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_easyaccess/user.dart';

class FirestoreService {
  var firestoreInstance = FirebaseFirestore.instance;

  Future<User?>? getDataTheBetterWay(String document) async {
    final _data = await firestoreInstance
        .collection('users')
        .doc(document)
        .withConverter<User>(
            fromFirestore: (snapshot, _) =>
                userFromJson(json.encode(snapshot.data())),
            toFirestore: (model, _) => json.decode(userToJson(model)))
        .get();
    return _data.data();
  }

  Future<Map<String, dynamic>?> getDataTheUsualWay(String document) async {
    final _data =
        (await firestoreInstance.collection('users').doc(document).get())
            .data();
    return _data;
  }

  Future<void> updateDataTheBetterWay(String document, String data) async {
    final userRef = firestoreInstance
        .collection('users')
        .doc(document)
        .withConverter<User>(
            fromFirestore: (snapshot, _) =>
                userFromJson(json.encode(snapshot.data())),
            toFirestore: (model, _) => model.toJson());
    User? user = (await userRef.get()).data();
    user!.people.friends[0].achievements[0].type = data;
    await userRef.set(user);
  }

  Future<void> updateDataTheUsualWay(String document, String data) async {
    final userRef = firestoreInstance.collection('users').doc(document);
    final userData = (await userRef.get()).data();
    var friendsList = userData!['people']['friends'];
    friendsList[0]['achievements'][0]['type'] = data;
    await userRef.update({
      "people": {"friends": friendsList}
    });
    print(data);
  }
}
