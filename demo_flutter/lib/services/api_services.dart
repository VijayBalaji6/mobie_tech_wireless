import 'package:demo_flutter/dashboard/model/product_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static final String apiUrl = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
static final Dio dio = Dio();


  static Future<List<ProductModel>> getAllProducts()async{
    try{
      final  productResponse =await dio.get(apiUrl);
      List<ProductModel> productList = [];
      for (var e in productResponse.data) {
       productList.add( ProductModel.fromMap(e));
      }
          return productList;
    }catch(e){
      rethrow;
      }
  }
}