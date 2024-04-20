import 'package:gallary_app/domain/entities/image_entities.dart';

abstract class ImageRepository {
  Future<List<ImageEntity>> getImages();
}
