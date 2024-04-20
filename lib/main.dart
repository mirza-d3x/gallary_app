import 'package:flutter/material.dart';
import 'package:gallary_app/data/repositories/image_repository.dart';
import 'package:gallary_app/domain/repositories/image_repositories.dart';
import 'package:gallary_app/domain/usecases/get_image_usecases.dart';
import 'package:gallary_app/presentation/screens/image_screen.dart';
import 'package:gallary_app/providers/image_provider.dart';
import 'package:provider/provider.dart';

void main() {
  final ImageRepository imageRepository = ImageRepositoryImpl();
  final GetImagesUseCase getImagesUseCase = GetImagesUseCase(imageRepository);

  runApp(
    ChangeNotifierProvider(
      create: (context) => FetchImageProvider(getImagesUseCase),
      child: const GallaryApp(),
    ),
  );
}

class GallaryApp extends StatelessWidget {
  const GallaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixabay Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageGalleryScreen(),
    );
  }
}
