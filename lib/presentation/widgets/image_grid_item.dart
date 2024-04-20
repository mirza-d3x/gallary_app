import 'package:flutter/material.dart';
import 'package:gallary_app/domain/entities/image_entities.dart';
import 'package:gallary_app/presentation/screens/full_image_screen.dart';

class ImageGridItem extends StatelessWidget {
  final ImageEntity image;

  ImageGridItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenImageScreen(imageUrl: image.imageUrl),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image.imageUrl,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 4.0),
          Text('Likes: ${image.likes}'),
          Text('Views: ${image.views}'),
        ],
      ),
    );
  }
}
