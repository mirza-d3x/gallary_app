import 'package:flutter/material.dart';
import 'package:gallary_app/presentation/widgets/image_grid_item.dart';
import 'package:gallary_app/providers/image_provider.dart';
import 'package:provider/provider.dart';

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<FetchImageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixabay Image Gallery'),
      ),
      body: _buildBody(imageProvider, context),
    );
  }

  Widget _buildBody(FetchImageProvider imageProvider, BuildContext context) {
    if (imageProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount(MediaQuery.of(context).size.width),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imageProvider.images.length,
        itemBuilder: (context, index) {
          final image = imageProvider.images[index];
          return ImageGridItem(image: image);
        },
      );
    }
  }

  int _crossAxisCount(double screenWidth) {
    if (screenWidth >= 800) {
      return 4; // Adjust for larger screens
    } else if (screenWidth >= 600) {
      return 3;
    } else {
      return 2;
    }
  }
}
