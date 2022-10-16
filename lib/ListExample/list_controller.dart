import 'package:dio/dio.dart';
import 'package:fetch_data_dio/model/BaseResponse.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  List<TCurrency> listCurrencies = [];
  bool isLoadingRequest = false;

  // var url = "https://jsonplaceholder.typicode.com/posts";
  var url = "https://newline.dev/currency/api/v1/currencies/list";

  /// Callin Api and getting data From server
  getCurrencies() async {
    isLoadingRequest = true;
    update();
    var response = await Dio().get(url);

    if (response.statusCode == 200) {



      ///Method 1
      // TBaseResponse tBaseResponse = TBaseResponse.fromJson(response.data);
      // print(tBaseResponse);
      // listCurrencies = tBaseResponse.currencies;


      ///Method 2
      listCurrencies =
      
      List<TCurrency>.
      from(response.data["currencies"]
          .map((object) =>
          TCurrency.fromJson(object))
      );

    }
    isLoadingRequest = false;
    update();
  }

  @override
  void onInit() {
    getCurrencies();
    super.onInit();
  }
}
