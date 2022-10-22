
import 'package:dio/dio.dart';
import 'package:fetch_data_dio/API/DioHelper.dart';

import '../Constants.dart';

class CurrencyController{

  static Future<Response>  getCurrencyList({Map<String,dynamic>? map}){
    return DioHelper().get(Constant.currenciesUrl,queryParameters: map);
  }

}