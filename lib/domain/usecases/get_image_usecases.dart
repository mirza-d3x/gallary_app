import 'package:gallary_app/domain/entities/image_entities.dart';
import 'package:gallary_app/domain/repositories/image_repositories.dart';

class GetImagesUseCase {
  final ImageRepository repository;

  GetImagesUseCase(this.repository);

  Future<List<ImageEntity>> getImages() async {
    return await repository.getImages();
  }
}
