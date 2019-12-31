import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImgUrl;
  final String email;
  final String bio;

  User({this.id, this.name, this.profileImgUrl, this.email, this.bio});

  // factory constructor
  factory User.fromDoc(DocumentSnapshot doc){
    return User(id: doc.documentID,
    name: doc["name"],
    profileImgUrl: doc["profileImageUrl"],
    email: doc["email"],
    bio: doc["bio"] ?? "",
    );
  }
}
