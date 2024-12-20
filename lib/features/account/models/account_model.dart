import 'package:cloud_firestore/cloud_firestore.dart';

class AccountModel {
  final String? name;
  final String? knownAs;
  final String? email;
  final String? bio;
  final String? profileURL;
  final String? coverURL;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  AccountModel({
    this.name,
    this.knownAs,
    this.email,
    this.bio,
    this.profileURL,
    this.coverURL,
    this.createdAt,
    this.updatedAt,
  });

  factory AccountModel.fromDocument(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return AccountModel(
      name: data['name'] ?? '',
      knownAs: data['known_as'] ?? '',
      email: data['email'] ?? '',
      bio: data['bio'] ?? '',
      profileURL: data['profile_url'] ?? '',
      coverURL: data['cover_url'] ?? '',
      createdAt: data['created_at'] ?? Timestamp.now(),
      updatedAt: data['updated_at'] ?? Timestamp.now(),
    );
  }
}
