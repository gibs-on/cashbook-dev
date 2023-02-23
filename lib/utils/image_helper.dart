import 'package:cashbook/constants/function_response.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImageType { network, file, asset, unknown }

class CustomImageHelper {
  FunctionResponse imageType(String _imagePath) {
    FunctionResponse _fResponse = FunctionResponse();
    try {
      final String _leftSubstring = _imagePath.substring(0, 8).toLowerCase();

      print('Image extension : $_leftSubstring');

      if (_leftSubstring.contains('http')) {
        _fResponse.data = ImageType.network;
      } else if (_leftSubstring.contains('data')) {
        _fResponse.data = ImageType.file;
      } else if (_leftSubstring.contains('asset')) {
        _fResponse.data = ImageType.asset;
      } else {
        _fResponse.data = ImageType.unknown;
      }
      _fResponse.success = true;
      _fResponse.message = 'Found image type';
    } catch (e) {
      _fResponse.success = false;
      _fResponse.message = 'Error finding image type';
    }

    return _fResponse;
  }

  Future<FunctionResponse> pickUserImage(BuildContext context) async {
    FunctionResponse _fResponse = FunctionResponse();
    String _pickedImage = '';
    final ImagePicker _picker = ImagePicker();
    await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('Select an Image'),
              actions: [
                TextButton(
                    onPressed: () async {
                      final XFile? image = await _picker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 50,
                          maxWidth: 150);
                      if (image == null) {
                        _pickedImage = '';

                        _fResponse.message = 'Image not picked';

                        Navigator.of(context).pop();
                      } else {
                        _pickedImage = image.path;

                        _fResponse.success = true;
                        _fResponse.data = _pickedImage;
                        _fResponse.message = 'Image picked From gallery';

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Open Gallery')),
                TextButton(
                    onPressed: () async {
                      final XFile? photo =
                          await _picker.pickImage(source: ImageSource.camera);
                      if (photo == null) {
                        _pickedImage = '';

                        _fResponse.message = 'Image not captured';

                        Navigator.of(context).pop();
                        return;
                      } else {
                        _pickedImage = photo.path;

                        _fResponse.success = true;
                        _fResponse.data = _pickedImage;
                        _fResponse.message = 'Image captured with Camera';

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Capture')),
              ],
            ));

    return _fResponse;
  }
}
