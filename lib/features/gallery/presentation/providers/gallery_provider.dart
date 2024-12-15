import 'package:century_art_flutter/features/gallery/model/gallery_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class GalleryProvider extends ChangeNotifier {
  final log = Logger();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<ArtModel> arts = [];

  Future<void> getArts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('arts').get();

      final art = snapshot.docs.map((docs) {
        return {"id": docs.id, ...docs.data() as Map<String, dynamic>};
      }).toList();

      arts = art.map((art) => ArtModel.fromJson(art)).toList();
      print(arts.first.title);
      notifyListeners();
    } catch (e) {
      log.e(e);
    }
  }
}
