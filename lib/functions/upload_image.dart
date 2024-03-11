import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

File? file;
String? imageUrl;
uploadImage() async {
  final ImagePicker picker = ImagePicker();

  //final XFile? imageGallery = await picker.pickImage(source: ImageSource.gallery);

  final XFile? imageCamra = await picker.pickImage(source: ImageSource.camera);
  if (imageCamra != null) {
    file = File(imageCamra.path);
    var imageName = basename(imageCamra.path);
    var refStorage = FirebaseStorage.instance.ref(imageName);
    await refStorage.putFile(file!);
    imageUrl = await refStorage.getDownloadURL();
  }
}
