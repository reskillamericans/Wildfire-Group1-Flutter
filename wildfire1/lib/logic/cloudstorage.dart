import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wildfire1/model/cloudresult.dart';

class CloudUpload {
  Future<CloudStorageResult> imageUpload(File? pickedImage) async {
    var imageName = "IMG" + DateTime.now().toString();
    final storage = FirebaseStorage.instance.ref().child(imageName);
    await storage.putFile(pickedImage!);
    final imageUrl = await storage.getDownloadURL();
    return CloudStorageResult(imageName: imageName, imageUrl: imageUrl);
  }
}
