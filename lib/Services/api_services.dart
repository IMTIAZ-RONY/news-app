import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/Model/news_model.dart';

class ApiService{
  final String allNewsApi="https://newsapi.org/v2/everything?q=bitcoin&apiKey=c900c90910c24e3a82fdd0d8f2eb8003";
  final String breakingNewsApi='https://newsapi.org/v2/top-headlines?country=us&apiKey=c900c90910c24e3a82fdd0d8f2eb8003';
//
//   Future<List<NewsModel>>getAllNews()async{
//   try{
//    Response response= await http.get(Uri.parse(allNewsApi));
//    if (response.statusCode == 200) {
//      Map<String,dynamic> json = jsonDecode(response.body) ;
//      List<dynamic> body = json["articles"];
//      List<NewsModel>articlesList=body.map((item)=>NewsModel.fromJson(item)).toList();
//      print(body);
//      return articlesList;
//
//    } else {
//      return  [];
//    }
//   }catch(e){
//     return [];
//   }
//
// }
//
// Future<List<NewsModel>>getBreakingNews()async{
//   try{
//    Response response= await http.get(Uri.parse(breakingNewsApi));
//    if (response.statusCode == 200) {
//      Map<String,dynamic> json = jsonDecode(response.body) ;
//      List<dynamic> body = json["articles"];
//      print(body.toString());
//      List<NewsModel>articlesList=body.map((item)=>NewsModel.fromJson(item)).toList();
//      print(articlesList.toString());
//      return articlesList;
//    } else {
//      return [];
//    }
//   }catch(e){
//     return [];
//   }
//
// }
  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await http.get(Uri.parse(allNewsApi));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<NewsModel> articlesList =
        body.map((item) => NewsModel.fromJson(item)).toList();
        print(body);
        return articlesList;
      } else {
        return []; // Return an empty list if the request is not successful
      }
    } catch (e) {
      return []; // Return an empty list if there is an exception
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      Response response = await http.get(Uri.parse(breakingNewsApi));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
       // print(body.toString());
        List<NewsModel> articlesList =
        body.map((item) => NewsModel.fromJson(item)).toList();
        print('articaleList${articlesList.toString()}');

        return articlesList;
      } else {
        return []; // Return an empty list if the request is not successful
      }
    } catch (e) {
      return []; // Return an empty list if there is an exception
    }
  }

}