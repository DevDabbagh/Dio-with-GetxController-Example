import 'package:dio/dio.dart';

import '../model/post_model.dart';

var url = "https://jsonplaceholder.typicode.com/posts";

void main() {
  _getDataList();
}


_getDataList() async {


  ///Request url wit get method
  var response = await Dio().get(url);
  /// posts list
  List<PostModel> posts = [];

  print(response.statusCode);

  if (response.statusCode == 200) {

    ///Convert each item to Post Model

    response.data.forEach(
      (element) {
        posts.add(PostModel.fromJson(element));
      },
    );
    // isLoading.value = false;
  }

  print(
      '\n************Start Response ********\n $response \n******************** END Response********************');

  for (var element in posts) {
    print('id ${element.id} , title : ${element.title}');
  }
}
