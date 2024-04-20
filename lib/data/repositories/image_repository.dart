import 'dart:convert';
import 'dart:developer';
import 'package:gallary_app/domain/entities/image_entities.dart';
import 'package:http/http.dart' as http;
import 'package:gallary_app/domain/repositories/image_repositories.dart';

class ImageRepositoryImpl implements ImageRepository {
  @override
  Future<List<ImageEntity>> getImages() async {
    const apiKey = '31411260-708fe0bc2f05c50b364618f26';
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=$apiKey&image_type=photo&per_page=50'));

    if (response.statusCode == 200) {
      log("Response: ${response.body}");
      final List<dynamic> data = json.decode(response.body)['hits'];
      return data
          .map((json) => ImageEntity(
                imageUrl: json['webformatURL'],
                likes: json['likes'],
                views: json['views'],
              ))
          .toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
