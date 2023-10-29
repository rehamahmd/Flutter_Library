class SliderModel {
  int id;
  int? parentId;
  String title;
  String description;
  String image;

  SliderModel({
    required this.id,
    this.parentId,
    required this.title,
    required this.description,
    required this.image,
  });
}
