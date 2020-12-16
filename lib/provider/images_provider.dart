import 'package:flutter/material.dart';
import 'package:me_car_interview/model/image_model.dart';

class ImagesServive with ChangeNotifier {
  List<ImageModel> imagedata = [
    ImageModel(image: 'assets/images/meo1.jpg', id: 1),
    ImageModel(image: 'assets/images/meo2.jpg', id: 2),
    ImageModel(image: 'assets/images/meo3.jpg', id: 3),
    ImageModel(image: 'assets/images/meo4.jpg', id: 4),
    ImageModel(image: 'assets/images/meo5.jpg', id: 5),
    ImageModel(image: 'assets/images/meo6.jpg', id: 6),
    ImageModel(image: 'assets/images/bg2.jpg', id: 7),
    ImageModel(image: 'assets/images/xe.jpg', id: 8),
    ImageModel(image: 'assets/images/ao.jpg', id: 9),
    ImageModel(image: 'assets/images/ao2.jpg', id: 10),
  ];

  loadMore() {
    var clone = [...imagedata];
    imagedata.addAll(clone);
    print(imagedata);
    notifyListeners();
  }
}
