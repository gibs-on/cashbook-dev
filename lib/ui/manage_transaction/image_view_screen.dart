import 'dart:io';

import 'package:cashbook/constants/function_response.dart';
import 'package:cashbook/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../service_locator.dart';

class ImageViewScreen extends StatelessWidget {
  ImageViewScreen({Key? key, required this.imagePath}) : super(key: key);
  //Utilities
  final CustomImageHelper _customImageHelper = getIt<CustomImageHelper>();

  //Screen
  final String imagePath;

  ImageType imageIsNetwork() {
    FunctionResponse _fResponse = getIt<FunctionResponse>();

    _fResponse = _customImageHelper.imageType(imagePath);

    if (!_fResponse.success) {
      _fResponse.data = ImageType.unknown;
    }
    return _fResponse.data;
  }

  @override
  Widget build(BuildContext context) {
    ImageType isNetwork = imageIsNetwork();

    final _image = (isNetwork == ImageType.network
        ? NetworkImage(imagePath)
        : FileImage(File(imagePath))) as ImageProvider;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: PhotoView(
        imageProvider: _image,
      )),
    );
  }
}
