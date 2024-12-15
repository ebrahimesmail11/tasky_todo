import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';

class LandingImage extends StatelessWidget {
  const LandingImage({
    super.key,
  
  });



  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Image.asset(
      ImagesManager.landingImage,
      height:height * .54 ,
      width: double.infinity,
      fit: Platform.isWindows ? BoxFit.contain : BoxFit.cover,
    );
  }
}