class ImageModel {
  final String image;
  final int id;
  
  ImageModel({
    this.image,
    this.id,
  });
}


final List<ImageModel> imagedata = [
  ImageModel(image: 'assets/images/meo1.jpg', id: 1),
  ImageModel(image: 'assets/images/meo2.jpg', id: 2),
  ImageModel(image: 'assets/images/meo3.jpg', id: 3),
  ImageModel(image: 'assets/images/meo4.jpg', id: 4),
  ImageModel(image: 'assets/images/meo5.jpg', id: 5),
  ImageModel(image: 'assets/images/meo6.jpg', id: 6),
];