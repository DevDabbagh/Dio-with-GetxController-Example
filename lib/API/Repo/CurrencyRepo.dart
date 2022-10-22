

import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:fetch_data_dio/API/Controller/CurrencyController.dart';
import 'package:fetch_data_dio/model/BaseResponse.dart';

class CurrencyRepo{

  static var instance = CurrencyRepo();

  Future<List<TCurrency>> getCurrencyRequest({Map<String,dynamic>? map}) async{

    List<TCurrency> listCurrencies=[];

    Response response = await CurrencyController.getCurrencyList(map: map);

    if(response.statusCode == 200){

      listCurrencies =
      List<TCurrency>.
      from(response.data["currencies"]
          .map((object) =>
          TCurrency.fromJson(object))
      );

    }

    return listCurrencies;
  }
}