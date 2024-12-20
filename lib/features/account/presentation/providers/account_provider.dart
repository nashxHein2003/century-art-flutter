import 'package:century_art_flutter/features/account/models/account_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AccountProvider extends ChangeNotifier {
  final log = Logger();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AccountModel accountInfo = AccountModel(
    name: '',
    knownAs: '',
    email: '',
    bio: '',
    profileURL: '',
    coverURL: '',
    createdAt: Timestamp.now(),
    updatedAt: Timestamp.now(),
  );

  Future<void> getUserInfo(final String? uid) async {
    try {
      final DocumentSnapshot document =
          await _firestore.collection('users').doc(uid).get();

      accountInfo = AccountModel.fromDocument(document);
      print(accountInfo);
      notifyListeners();
    } on FirebaseException catch (e) {
      log.e(e);
    }
  }
}
