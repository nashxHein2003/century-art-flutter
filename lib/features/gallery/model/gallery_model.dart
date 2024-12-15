import 'package:cloud_firestore/cloud_firestore.dart';

class ArtModel {
  final String id;
  final String uid;
  final String title;
  final String description;
  final String imageUrl;
  final Timestamp createdAt;

  ArtModel({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory ArtModel.fromJson(Map<String, dynamic> json) {
    return ArtModel(
      id: json['id'],
      uid: json['uid'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      //createdAt: DateTime.parse(json['created_at']),
      createdAt: json['created_at'],
    );
  }
}
