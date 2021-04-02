import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_book/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usernameCollection =
      FirebaseFirestore.instance.collection('usernames');

  Future updateUserData(String username) async {
    return await usernameCollection.doc(uid).set({'username': username});
  }

  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      username: snapshot.data()['username'],
    );
  }

  Stream<UserData> get userData {
    return usernameCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
