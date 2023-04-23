import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService {
  getImage(String? imagePath) async {
    if (imagePath == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage.child(imagePath);
      var imageUrl = await urlRef.getDownloadURL();
      debugPrint(imageUrl);
      return imageUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
