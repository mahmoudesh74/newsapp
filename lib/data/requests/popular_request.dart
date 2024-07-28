import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/domain/models/popular_info_model.dart';
import 'package:project/domain/models/popular_model.dart';

import '../../domain/models/image_model.dart';
class PopularRequest{
  static void getPopular({
  required Function(List<Results>?)onSuccess,
    required Function(int statusCode)onError,

})
  async{
    Map<String,String>headers={
      "Content-Type":"application/json"
    };
    await http.get(Uri.parse("https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b"),
    headers: headers,
    ).then((response) {
      if(response.statusCode==200){
        Map<String,dynamic>decoded={};
        decoded=json.decode(response.body);
        PopularModel popularModel=PopularModel.fromJson(decoded);
        onSuccess(popularModel.results);
      }
      else{
        onError(response.statusCode);
      }

    } );

  }
    static void getPopularInfo({
      required int id,
  required Function(PopularInfoModel)onSuccess,
    required Function(int error)onError,

})
  async{
    Map<String,String>headers={
      "Content-Type":"application/json"
    };
    await http.get(Uri.parse("https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b"),
    headers: headers,
    ).then((response) {
      if(response.statusCode==200){
        Map<String,dynamic>decoded={};
        decoded=json.decode(response.body);
        PopularInfoModel popularInfoModel=PopularInfoModel.fromJson(decoded);
        onSuccess(popularInfoModel);
      }
      else{
        onError(response.statusCode);
      }

    } );

  }
  static void getPopularImage({
      required int id,
  required Function(ImageModel)onSuccess,
    required Function(int error)onError,

})
  async{
    Map<String,String>headers={
      "Content-Type":"application/json"
    };
    await http.get(Uri.parse("https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),
    headers: headers,
    ).then((response) {
      if(response.statusCode==200){
        Map<String,dynamic>decoded={};
        decoded=json.decode(response.body);
        ImageModel imageModel=ImageModel.fromJson(decoded);
        onSuccess(imageModel);
      }
      else{
        onError(response.statusCode);
      }

    } );

  }

}