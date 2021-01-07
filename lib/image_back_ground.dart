import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBackGround extends StatelessWidget {
  const ImageBackGround({
    @required this.imageWidth,
    @required this.imageHeight,
    this.imageUrl,
  });
  final double imageWidth;
  final double imageHeight;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          alignment: Alignment.topLeft,
          image: imageUrl == null
              ? const DecorationImage(
                  fit: BoxFit.contain,
                  alignment: Alignment.topLeft,
                  image: AssetImage('assets/images/Img_default_maps.png'),
                )
              : CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }
}
