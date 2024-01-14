import 'package:image_search_app_futurebuilder_01/data/image_model.dart';
import 'package:image_search_app_futurebuilder_01/data/paxabay_dto.dart';

extension DtoToModel on Hits {
  ImageModel toImageItem() {
    return ImageModel(
      ImageUrl: previewURL ?? '',
      tags: tags ?? '',
    );
  }
}
