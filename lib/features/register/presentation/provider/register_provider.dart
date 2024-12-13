import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void insertUserInfo() async {
    User? user = _auth.currentUser;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': '',
        'known_as': '',
        'email': user.email,
        'profile_url': '',
        'cover_url': '',
        'bio': '',
        'created_at': DateTime.now(),
        'updated_at': DateTime.now()
      });
    }
  }
}
