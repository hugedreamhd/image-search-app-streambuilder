import 'dart:async';

import 'package:image_search_app_futurebuilder_01/data/image_model.dart';
import 'package:image_search_app_futurebuilder_01/data/image_repository.dart';

final class ViewModel {
  final _repository = PixabayImageItemsRepository();

  List<ImageModel> _imageItems = [];
  final _loadingController = StreamController<bool>();

  Stream<bool> get loadingController => _loadingController.stream;
  List<ImageModel> get imageItems => List.unmodifiable(_imageItems);

  Future<void> searchImage(String query) async {
    //화면 갱신
    _loadingController.add(true);
    _imageItems = await _repository.getImageSource(query);

    //다시 화면 갱신
    _loadingController.add(false);
  }


}