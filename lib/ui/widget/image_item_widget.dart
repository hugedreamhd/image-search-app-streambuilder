import 'package:flutter/material.dart';
import 'package:image_search_app_futurebuilder_01/data/image_model.dart';

class ImageItemWidget extends StatelessWidget {

  const ImageItemWidget({super.key, required this.imageItem});

  final ImageModel imageItem;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        imageItem.ImageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
