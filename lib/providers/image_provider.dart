import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:gallary_app/domain/entities/image_entities.dart';
import 'package:gallary_app/domain/usecases/get_image_usecases.dart';

class FetchImageProvider extends ChangeNotifier {
  final GetImagesUseCase _getImagesUseCase;

  FetchImageProvider(this._getImagesUseCase) {
    fetchImages();
  }

  List<ImageEntity> _images = [];
  List<ImageEntity> get images => _images;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchImages() async {
    try {
      _isLoading = true;
      notifyListeners();
      _images = await _getImagesUseCase.getImages();
    } catch (error) {
      log('Error fetching images: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
