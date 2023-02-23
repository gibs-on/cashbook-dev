import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cashbook/constants/function_response.dart';

class ImageUploadHelper {
  Future<FunctionResponse> uploadPicture(File _imageFile) async {
    FunctionResponse _fResponse = FunctionResponse();

    try {
      FirebaseStorage _storage = FirebaseStorage.instance;
      print('Storage instance');
      Reference _ref =
          _storage.ref().child('cashbook/' + DateTime.now().toIso8601String());
      print('got ref = $_ref');
      await _ref.putFile(File(_imageFile.path));
      print('uploaded image = $_ref');
      String _imageUrl = await _ref.getDownloadURL();
      print('got URL $_imageUrl');

      _fResponse.success = true;
      _fResponse.message = 'Image successfully uploaded';
      _fResponse.data = _imageUrl;
    } catch (e) {
      _fResponse.message = 'Error Uploading Image : $e';
    }
    return _fResponse;
  }
}
