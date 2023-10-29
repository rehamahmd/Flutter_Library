import 'dart:math';

import 'package:flutter_app/models/models.dart';

class SlidersData {
  static const imgList = [
    "https://images.unsplash.com/photo-1633114128814-11fac33f707b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://image.freepik.com/free-photo/business-team-working-together-office-with-laptop_23-2149206534.jpg",
    "https://image.freepik.com/free-photo/elevated-view-magnifying-glass-burnt-paper-knife-map_23-2147837103.jpg",
    "https://image.freepik.com/free-photo/businessman-reading-daily-news_53876-15138.jpg",
    "https://image.freepik.com/free-photo/young-man-walking-towards-great-sphinx-giza_181624-51674.jpg",
    "https://images.pexels.com/photos/2007647/pexels-photo-2007647.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "https://image.freepik.com/free-photo/viewpoint-alabaster-mosque-blue-sky-cairo-egypt_181624-52492.jpg",
    "https://image.freepik.com/free-photo/egyptian-desert-design_1048-1862.jpg",
    "https://unsplash.com/photos/0HOGSrEwLrg/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8YWV1NnJMLWo2ZXd8fHx8fDJ8fDE2MzkwNDM4NjY&force=true&w=640",
    "https://unsplash.com/photos/_jw7pZVwFrg/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8YWV1NnJMLWo2ZXd8fHx8fDJ8fDE2MzkwNDM4NjY&force=true&w=640",
    "https://unsplash.com/photos/5af1bWt2cSg/download?force=true&w=640",
  ];

  static List<SliderModel> generateRandomSlidersList(int slidersNumbers, List<String> imageList,
      {int? parentId}) {
    List<SliderModel> sliders = [];
    final _random = Random();

    for (var i = 1; i <= (imageList.isEmpty ? slidersNumbers : imageList.length); i++) {
      var image = imageList.isEmpty ? imgList[_random.nextInt(imgList.length)] : imageList[i - 1];
      var newSlider = SliderModel(
        id: i,
        parentId: parentId,
        title: "Slider Title $i",
        description: "Slider Description $i",
        image: image,
      );
      sliders.add(newSlider);
    }
    return sliders;
  }

  static List<SliderModel> generateRandomChildSlidersForParent(
      int parentSlidersLength, List<String> imageList,
      {int childSlidersLength = 5}) {
    List<SliderModel> childSliders = [];

    for (var i = 1; i <= (imageList.isEmpty ? parentSlidersLength : imageList.length); i++) {
      childSliders.addAll(
        generateRandomSlidersList(childSlidersLength, imageList, parentId: i),
      );
    }
    return childSliders;
  }
}
