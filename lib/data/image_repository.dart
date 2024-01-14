import 'package:image_search_app_futurebuilder_01/data/image_model.dart';
import 'package:image_search_app_futurebuilder_01/data/image_source.dart';
import 'package:image_search_app_futurebuilder_01/data/mapper.dart';

abstract interface class ImageItemRepository {
  Future<List<ImageModel>> getImageSource(String query);
}

class PixabayImageItemsRepository extends ImageItemRepository {
  final _api = ImageApi();

  @override
  Future<List<ImageModel>> getImageSource(String query) async {
    final dto = await _api.getImageSource(query);
    if (dto.hits == null) {
      return [];
    }
    return dto.hits!.map((e) => e.toImageItem()).toList();
  }
}